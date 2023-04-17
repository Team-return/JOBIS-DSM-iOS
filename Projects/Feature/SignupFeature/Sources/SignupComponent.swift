import SwiftUI
import StudentsDomainInterface
import SignupFeatureInterface
import AuthDomainInterface
import NeedleFoundation

public protocol SignupDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
}

public final class SignupComponent: Component<SignupDependency>, SignupFactory {
    public func makeView() -> some View {
        SignupView(
            viewModel: .init(
                signupUseCase: dependency.signupUseCase,
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase
            )
        )
    }
}
