import SwiftUI
import ApplicationsDomainInterface
import StudentsDomainInterface
import HomeFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase { get }
    var fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase { get }
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var recruitmentComponent: RecruitmentComponent { get }
    var findWorkSpaceComponent: FindWorkSpaceComponent { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        NavigationView {
            HomeView(
                viewModel: .init(
                    fetchApplicationUseCase: dependency.fetchApplicationUseCase,
                    fetchTotalPassStudentUseCase: dependency.fetchTotalPassStudentUseCase,
                    fetchStudentInfoUseCase: dependency.fetchStudentInfoUseCase
                ),
                recruitmentComponent: dependency.recruitmentComponent,
                findWorkSpaceComponent: dependency.findWorkSpaceComponent
            )
        }
    }
}
