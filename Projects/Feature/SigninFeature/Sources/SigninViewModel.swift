import BaseFeature
import UserDomainInterface
import Combine

final class SigninViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSuccessSignin = false
    @Published var authorityEntity: AuthorityEntity?

    private let signinUseCase: SigninUseCase

    public init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    func signinButtonDidTap() {
        addCancellable(
            signinUseCase.execute(
                req: .init(
                    accountID: email,
                    password: password
                )
            )
        ) { [weak self] authority in
            self?.authorityEntity = authority
            self?.isSuccessSignin = true
        }
    }
}
