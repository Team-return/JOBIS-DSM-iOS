import SwiftUI
import SignupFeatureInterface
import NeedleFoundation

public protocol InfoSettingDependency: Dependency {
    var signupEmailVerifyComponent: SignupEmailVerifyComponent { get }
}

public final class InfoSettingComponent: Component<InfoSettingDependency>, SignupFactory {
    public func makeView() -> some View {
        InfoSettingView(
            viewModel: .init(),
            signupEmailVerifyComponent: dependency.signupEmailVerifyComponent
        )
    }
}
