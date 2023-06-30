import BaseFeature
import AuthDomainInterface
import Foundation
import Combine

final class AuthenticationEmailViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var authCode: String = ""
    @Published var isShowMessageToast = false
    @Published var sendEmailButtonTitle = "인증요청"
    @Published var isEmailSend = false
    @Published var isAuthCodeError = false
    @Published var isNavigateRenewalPassword = false
    @Published var isShowEmailVerifyErrorToast = false

    @Published var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var timeText: String {
        timeRemaining == 0 ? "" : timeRemaining % 60 < 10 ?
        "\(timeRemaining/60):0\(timeRemaining%60)" :
        "\(timeRemaining/60):\(timeRemaining%60)"
    }

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    ) {
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

    func sendAuthCode() {
        addCancellable(
            sendAuthCodeUseCase.execute(
                req: .init(
                    email: email,
                    authCodeType: .password
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

    func emailVerifyNextButtonDidTap() {
        addCancellable(
            verifyAuthCodeUseCase.execute(email: email, authCode: authCode)
        ) { [weak self] _ in
            self?.isNavigateRenewalPassword.toggle()
        } onReceiveError: { [weak self] _ in
            self?.isAuthCodeError = true
        }
    }
}
