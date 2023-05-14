import SwiftUI
import StudentsDomainInterface
import SignupFeatureInterface
import AuthDomainInterface
import NeedleFoundation

public protocol SignupDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
    var studentExistsUseCase: any StudentExistsUseCase { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
}

public final class SignupComponent: Component<SignupDependency>, SignupFactory {
    public func makeView() -> some View {
        SignupView(
            viewModel: .init(
                signupUseCase: dependency.signupUseCase,
                studentExistsUseCase: dependency.studentExistsUseCase,
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase
            )
        )
    }
}
