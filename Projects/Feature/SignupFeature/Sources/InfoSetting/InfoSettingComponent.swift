import SwiftUI
import SignupFeatureInterface
import NeedleFoundation

public protocol InfoSettingDependency: Dependency {
}

public final class InfoSettingComponent: Component<InfoSettingDependency>, SignupFactory {
    public func makeView() -> some View {
        InfoSettingView(
            viewModel: .init()
        )
    }
}
