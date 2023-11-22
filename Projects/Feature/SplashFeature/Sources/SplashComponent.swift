import SwiftUI
import NeedleFoundation
import SplashFeatureInterface
import AuthDomainInterface
import UsersDomainInterface

public protocol SplashDependency: Dependency {
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
    var fetchMarketVersionUseCase: any FetchMarketVersionUseCase { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                reissueTokenUseCase: dependency.reissueTokenUseCase,
                fetchMarketVersionUseCase: dependency.fetchMarketVersionUseCase
            )
        )
    }
}
