import SwiftUI
import NeedleFoundation
import AuthFeatureInterface

public protocol AuthDependency: Dependency {}

public final class AuthComponent: Component<AuthDependency>, AuthFactory {
    public func makeView() -> some View {
        AuthView(viewModel: .init())
    }
}
