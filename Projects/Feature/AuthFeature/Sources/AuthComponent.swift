import SwiftUI
import NeedleFoundation
import AuthFeatureInterface
import SigninFeature
import SignupFeature

public protocol AuthDependency: Dependency {
    var signinComponent: SigninComponent { get }
    var signupComponent: SignupComponent { get }
}

public final class AuthComponent: Component<AuthDependency>, AuthFactory {
    public func makeView() -> some View {
        AuthView(
            viewModel: .init(),
            signinComponent: dependency.signinComponent,
            signupComponent: dependency.signupComponent
        )
    }
}
