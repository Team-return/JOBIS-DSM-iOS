import SwiftUI
import SignupFeatureInterface
import NeedleFoundation

public protocol SignupEmailVerifyDependency: Dependency {
    var signupPasswordComponent: SignupPasswordComponent { get }
}

public final class SignupEmailVerifyComponent: Component<SignupEmailVerifyDependency>, SignupFactory {
    public func makeView() -> some View {
        SignupEmailVerifyView(
            viewModel: .init(),
            signupPasswordComponent: dependency.signupPasswordComponent
        )
    }
}
