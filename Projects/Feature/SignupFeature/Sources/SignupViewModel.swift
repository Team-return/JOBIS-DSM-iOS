import BaseFeature
import Combine
import StudentsDomainInterface
import AuthDomainInterface
import UIKit
import UtilityModule

final class SignupViewModel: BaseViewModel {
    enum SignupType {
        case infoSetting
        case emailVerify
        case password
    }
    @Published var isSuccessSignup = false
    @Published var signupType: SignupType = .infoSetting {
        didSet {
            switch signupType {
            case .infoSetting:
                nextButtonTitle = "다음"
            case .emailVerify:
                nextButtonTitle = "인증확인"
            case .password:
                nextButtonTitle = "회원가입"
            }
        }
    }
    @Published var progressValue: Int = 0 {
        didSet {
            if progressValue > 3 {
                progressValue -= 1
            } else if progressValue < 0 {
                progressValue += 1
            }
        }
    }
    @Published var isMan: Bool = false {
        didSet {
            if self.isMan == true {
                self.isWoman = false
            }
        }
    }
    @Published var isWoman: Bool = false {
        didSet {
            if self.isWoman == true {
                self.isMan = false
            }
        }
    }
    @Published var name: String = ""
    @Published var grade: String = ""
    @Published var classRoom: String = ""
    @Published var number: String = ""
    @Published var email: String = ""
    @Published var authCode: String = ""
    @Published var password: String = ""
    @Published var checkPassword: String = ""

    @Published var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timeText: String {
        timeRemaining == 0 ? "" : timeRemaining % 60 < 10 ?
        "\(timeRemaining/60):0\(timeRemaining%60)" :
        "\(timeRemaining/60):\(timeRemaining%60)"
    }

    var isButtonEnabled: Bool {
        switch signupType {
        case .infoSetting:
            return grade.isEmpty || name.isEmpty || classRoom.isEmpty || number.isEmpty || !(isWoman || isMan)
        case .emailVerify:
            return !isEmailSend
        case .password:
            return password.isEmpty && checkPassword.isEmpty
        }
    }

    @Published var nextButtonTitle: String = "다음"
    @Published var sendEmailButtonTitle: String = "인증요청"

    @Published var isEmailSend: Bool = false
    @Published var isEmailVerified: Bool = false

    @Published var isShowMessageToast: Bool = false
    @Published var isShowSignupErrorToast: Bool = false
    @Published var isShowEmailVerifyErrorToast: Bool = false

    @Published var isInfoSettingError: Bool = false
    @Published var isAuthCodeError: Bool = false
    @Published var isPasswordRegexError: Bool = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isPasswordRegexError = false
            }
        }
    }
    @Published var isPasswordMismatchedError: Bool = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isPasswordMismatchedError = false
            }
        }
    }

    private let signupUseCase: SignupUseCase
    private let studentExistsUseCase: StudentExistsUseCase
    private let sendAuthCodeUseCase: SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: VerifyAuthCodeUseCase

    public init(
        signupUseCase: any SignupUseCase,
        studentExistsUseCase: any StudentExistsUseCase,
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    ) {
        self.signupUseCase = signupUseCase
        self.studentExistsUseCase = studentExistsUseCase
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase

        super.init()

        addCancellable(
            timer.setFailureType(to: Error.self).eraseToAnyPublisher()
        ) { [weak self] _ in
            guard let self, self.timeRemaining > 0 else { return }
            self.timeRemaining -= 1
        }
    }

    func nextButtonDidTap() {
        switch signupType {
        case .infoSetting:
            infoSettingNextButtonDidTap()

        case .emailVerify:
            emailVerifyNextButtonDidTap()

        case .password:
            passwordNextButtonDidTap()
        }
    }

    func backButtonDidTap(_ action: () -> Void) {
        switch signupType {
        case .infoSetting:
            action()

        case .emailVerify:
            signupType = .infoSetting
            progressValue -= 1

        case .password:
            signupType = .emailVerify
            progressValue -= 1
        }
    }

    // MARK: - Email Verify
    func sendAuthCode() {
        addCancellable(
            sendAuthCodeUseCase.execute(
                req: .init(
                    email: email,
                    authCodeType: .signup,
                    userName: name
                )
            )
        ) { [weak self] in
            self?.timeRemaining = 300
            self?.isShowMessageToast = true
            self?.sendEmailButtonTitle = "재발송"
            self?.isEmailSend = true
        } onReceiveError: { [weak self] _ in
            self?.isShowEmailVerifyErrorToast = true
        }
    }

    private func verifyAuthCode() {
        addCancellable(
            verifyAuthCodeUseCase.execute(email: email, authCode: authCode)
        ) { [weak self] _ in
            self?.isShowSuccessVerifyEmailToast = true
            self?.isEmailVerified = true
            self?.nextButtonTitle = "다음"
        } onReceiveError: { [weak self] _ in
            self?.isAuthCodeError = true
        }
    }

    private func emailVerifyNextButtonDidTap() {
        if isEmailVerified {
            signupType = .password
            progressValue += 1
        } else {
            verifyAuthCode()
        }
    }

    // MARK: - InfoSetting
    private func infoSettingNextButtonDidTap() {
        if isButtonEnabled {
            isInfoSettingError = true
            errorMessage = "공백이 있습니다."
        } else {
            let formattedNumber = String(format: "%02d", Int(number) ?? 0)
            let gcn = Int(grade + classRoom + formattedNumber) ?? 0
            addCancellable(
                studentExistsUseCase.execute(gcn: gcn, name: name)
            ) { [weak self] in
                self?.signupType = .emailVerify
                self?.progressValue += 1
            } onReceiveError: { [weak self] _ in
                self?.isInfoSettingError = true
            }
        }
    }

    // MARK: - Password
    private func signup() {
        let gender: GenderType? = {
            if isMan {
                return .man
            } else if isWoman {
                return .woman
            } else {
                return nil
            }
        }()
        guard let grade = Int(grade),
              let gender = gender,
              let classRoom = Int(classRoom),
              let number = Int(number) else { return }

        addCancellable(
            signupUseCase.execute(
                req: .init(
                    email: email,
                    password: password,
                    grade: grade,
                    name: name,
                    gender: gender,
                    classRoom: classRoom,
                    number: number
                )
            )
        ) { [weak self] _ in
            self?.isSuccessSignup = true
        } onReceiveError: { [weak self] _ in
            self?.isShowSignupErrorToast = true
        }
    }
    private func passwordNextButtonDidTap() {
        let passwordExpression = "^(?=.*[A-Za-z])(?=.*)(?=.*[~!@#$%^&*()+|=])[A-Za-z~!@#$%^&*()+|=]{8,16}"

        guard password ~= passwordExpression else {
            isPasswordRegexError = true
            return
        }

        guard password == checkPassword else {
            isPasswordMismatchedError = true
            return
        }

        signup()
    }
}
