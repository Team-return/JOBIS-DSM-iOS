import SwiftUI
import SignupFeatureInterface
import NeedleFoundation

public protocol SignupDependency: Dependency {}

public final class SignupComponent: Component<SignupDependency>, SignupFactory {
    public func makeView() -> some View {
        SignupView(viewModel: .init())
    }
}
