import SwiftUI
import AuthDomainInterface
import NeedleFoundation
import RenewalPasswordFeatureInterface

public protocol AuthenticationEmailDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var renewalPasswordFactory: any RenewalPasswordFactory { get }
}

public final class AuthenticationEmailComponent: Component<AuthenticationEmailDependency>,
                                                 AuthenticationEmailFactory {
    public func makeView() -> some View {
        AuthenticationEmailView(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase
            ),
            renewalPasswordFactory: dependency.renewalPasswordFactory
        )
    }
}

