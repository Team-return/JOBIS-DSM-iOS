import BaseFeature
import Foundation
import StudentsDomainInterface
import Combine
import UtilityModule

final class RenewalPasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { resettingError() }
    }
    @Published var passwordCheck = "" {
        didSet { resettingError() }
    }
    @Published var isTappedChangePassword = false
    @Published var isPasswordRegexError = false
    @Published var isPasswordMismatchedError = false
    @Published var isSuccessRenewalPassword = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    var iChangePasswordEnabled: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    let email: String
    private let renewalPasswordUseCase: any RenewalPasswordUseCase

    public init(
        renewalPasswordUseCase: any RenewalPasswordUseCase,
        email: String
    ) {
        self.renewalPasswordUseCase = renewalPasswordUseCase
        self.email = email
    }
    func changePasswordButtonDidTap() {
        guard iChangePasswordEnabled else {
            return
        }

        let passwordExpression = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"#

        guard password ~= passwordExpression else {
            isPasswordRegexError = true
            return
        }

        guard password == passwordCheck else {
            isPasswordMismatchedError = true
            return
        }

        isTappedChangePassword = true
    }

    func changePassword() {
        addCancellable(
            renewalPasswordUseCase.execute(
                req: .init(email: email, password: password)
            )
        ) { [weak self] _ in
            self?.isSuccessRenewalPassword = true
        }
    }

    func resettingError() {
        isPasswordRegexError = false
        isPasswordMismatchedError = false
    }

}
