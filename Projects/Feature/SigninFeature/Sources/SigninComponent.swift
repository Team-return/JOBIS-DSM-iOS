import SwiftUI
import UserDomainInterface
import NeedleFoundation
import SigninFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView(
        signinAnimation: Namespace.ID,
        isPresented: Binding<Bool>
    ) -> some View {
        SigninView(
            isPresented: isPresented,
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            ),
            signinAnimation: signinAnimation
        )
    }
}
