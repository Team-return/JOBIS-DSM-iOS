import SwiftUI
import SignupFeatureInterface
import NeedleFoundation

public protocol SignupPasswordDependency: Dependency {

}

public final class SignupPasswordComponent: Component<SignupPasswordDependency>, SignupFactory {
    public func makeView() -> some View {
        SignupPasswordView(
            viewModel: .init()
        )
    }
}
