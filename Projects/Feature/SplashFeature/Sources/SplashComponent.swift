import SwiftUI
import NeedleFoundation
import SplashFeatureInterface
import UserDomainInterface

public protocol SplashDependency: Dependency {
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                reissueTokenUseCase: dependency.reissueTokenUseCase
            )
        )
    }
}
