import SwiftUI
import NeedleFoundation
import SigninFeatureInterface

public protocol SigninDependency: Dependency {}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView(
        signinAnimation: Namespace.ID,
        isPresented: Binding<Bool>
    ) -> some View {
        SigninView(
            isPresented: isPresented,
            viewModel: .init(),
            signinAnimation: signinAnimation
        )
    }
}
