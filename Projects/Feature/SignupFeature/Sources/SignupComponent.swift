import SwiftUI
import StudentsDomainInterface
import SignupFeatureInterface
import NeedleFoundation

public protocol SignupDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
}

public final class SignupComponent: Component<SignupDependency>, SignupFactory {
    public func makeView(
        signupAnimation: Namespace.ID,
        isPresented: Binding<Bool>
    ) -> some View {
        SignupView(
            isPresented: isPresented,
            viewModel: .init(
                signupUseCase: dependency.signupUseCase
            ),
            signupAnimation: signupAnimation
        )
    }
}
