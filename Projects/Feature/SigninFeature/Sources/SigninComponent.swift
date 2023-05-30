import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import SigninFeatureInterface
import SignupFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var signupFactory: any SignupFactory { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            ),
            signupFactory: dependency.signupFactory
        )
    }
}
