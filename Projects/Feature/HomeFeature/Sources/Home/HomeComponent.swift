import SwiftUI
import ApplicationsDomainInterface
import HomeFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase { get }
    var recruitmentComponent: RecruitmentComponent { get }
    var findWorkSpaceComponent: FindWorkSpaceComponent { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        NavigationView {
            HomeView(viewModel: .init(fetchApplicationUseCase: dependency.fetchApplicationUseCase),
                     recruitmentComponent: dependency.recruitmentComponent,
                     findWorkSpaceComponent: dependency.findWorkSpaceComponent)
        }
    }
}
