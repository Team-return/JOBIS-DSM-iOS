import SwiftUI
import StudentsDomainInterface
import HomeFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchMainPageInfoUseCase: any FetchMainPageInfoUseCase { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        NavigationView {
            HomeView(viewModel: .init(fetchMainPageInfoUseCase: dependency.fetchMainPageInfoUseCase))
        }
    }
}
