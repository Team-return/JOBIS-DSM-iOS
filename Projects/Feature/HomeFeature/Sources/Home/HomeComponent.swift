import SwiftUI
import ApplicationsDomainInterface
import StudentsDomainInterface
import HomeFeatureInterface
import RecruitmentFeature
import FindCompanyFeature
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase { get }
    var fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase { get }
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var recruitmentComponent: RecruitmentComponent { get }
    var findCompanyComponent: FindCompanyComponent { get }
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
                findCompanyComponent: dependency.findCompanyComponent
            )
        }
    }
}
