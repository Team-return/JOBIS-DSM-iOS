import Foundation
import BaseFeature
import UsersDomainInterface
import Combine

final class SigninViewModel: BaseViewModel {
    @Published var isNavigateSignup = false
    @Published var isNavigateRenewalPassword = false
    @Published var isOnAppear = false
    @Published var authority: AuthorityType?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSuccessSignin = false
    @Published var isEmailError = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isEmailError = false
            }
        }
    }
    @Published var isPasswordError = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isPasswordError = false
            }
        }
    }
    @Published var isShowToast = false
    @Published var isAutoSignin = true

    private let signinUseCase: SigninUseCase

    public init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    private func signin() {
        addCancellable(
            signinUseCase.execute(
                req: .init(
                    accountID: email,
                    password: password
                )
            )
        ) { [weak self] authority in
            self?.authority = authority.authority
            if authority.authority == .student ||
                authority.authority == .developer {
                self?.isSuccessSignin = true
            }
        } onReceiveError: { error in
            guard let usersError = error as? UsersDomainError else { return }

            switch usersError {
            case .notFoundPassword:
                self.isPasswordError = true

            case .notFound:
                self.isEmailError = true

            default:
                self.isShowToast = true
            }
        }
    }

    func signinButtonDidTap() {
        if self.email.isEmpty {
            self.isEmailError = true
            self.errorMessage = "아이디는 공백이 들어갈 수 없습니다."
        } else if self.password.isEmpty {
            self.isPasswordError = true
            self.errorMessage = "비밀번호는 공백이 들어갈 수 없습니다."
        } else { signin() }
    }
}
