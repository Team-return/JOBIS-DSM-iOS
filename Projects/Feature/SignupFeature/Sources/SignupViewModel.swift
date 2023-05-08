import BaseFeature
import Combine
import StudentsDomainInterface
import AuthDomainInterface

final class SignupViewModel: BaseViewModel {
    enum SignupType {
        case infoSetting
        case emailVerify
        case password
    }
    @Published var signupType: SignupType = .infoSetting
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

    @Published var verifyEmailTitle: String = "인증확인"
    @Published var sendEmailTitle: String = "인증요청"

    @Published var isShowMessageToast: Bool = false
    @Published var isShowErrorToast: Bool = false

    private let signupUseCase: SignupUseCase
    private let sendAuthCodeUseCase: SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: VerifyAuthCodeUseCase

    public init(
        signupUseCase: any SignupUseCase,
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    ) {
        self.signupUseCase = signupUseCase
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
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
            self?.isShowMessageToast = true
        } onReceiveError: { _ in
            self.isShowErrorToast = true
        }
    }

    func verifyAuthCode() {
        addCancellable(
            verifyAuthCodeUseCase.execute(email: email, authCode: authCode)
        ) { [weak self] _ in
            self?.isShowMessageToast = true
        }
    }

    private func infoSettingNextButtonDidTap() {
        signupType = .emailVerify
        progressValue += 1
    }

    private func emailVerifyNextButtonDidTap() {
        signupType = .password
        progressValue += 1
    }

    private func passwordNextButtonDidTap() {
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
            print(self?.$email ?? "성공")
        } onReceiveError: { [weak self] _ in
            print(self?.$email ?? "실패")
        }
    }
}
