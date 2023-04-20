import SwiftUI
import UsersDomainInterface
import NeedleFoundation
import SigninFeatureInterface
import SignupFeature

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var infoSettingComponent: InfoSettingComponent { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            ),
            infoSettingComponent: dependency.infoSettingComponent
        )
    }
}
