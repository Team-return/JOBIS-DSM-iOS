import SwiftUI
import StudentsDomainInterface
import NeedleFoundation
import RenewalPasswordFeatureInterface

public protocol RenewalPasswordDependency: Dependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase { get }
}

public final class RenewalPasswordComponent: Component<RenewalPasswordDependency>,
                                             RenewalPasswordFactory {
    public func makeView(email: String) -> some View {
        RenewalPasswordView(
            viewModel: .init(
                renewalPasswordUseCase: dependency.renewalPasswordUseCase,
                email: email
            )
        )
    }
}
