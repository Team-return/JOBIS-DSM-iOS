import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import SigninFeatureInterface
import SignupFeatureInterface
import RenewalPasswordFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var signupFactory: any SignupFactory { get }
    var authenticationEmailFactory: any AuthenticationEmailFactory { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            ),
            signupFactory: dependency.signupFactory,
            authenticationEmailFactory: dependency.authenticationEmailFactory
        )
    }
}
