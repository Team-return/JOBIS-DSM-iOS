import SwiftUI
import ApplicationsDomainInterface
import StudentsDomainInterface
import HomeFeatureInterface
import RecruitmentFeatureInterface
import FindCompanyFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase { get }
    var fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase { get }
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var recruitmentFactory: any RecruitmentFactory { get }
    var findCompanyFactory: any FindCompanyFactory { get }
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
                recruitmentFactory: dependency.recruitmentFactory,
                findCompanyFactory: dependency.findCompanyFactory
            )
        }
    }
}
