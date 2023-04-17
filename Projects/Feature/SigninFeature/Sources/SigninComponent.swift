import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import SigninFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            )
        )
    }
}
