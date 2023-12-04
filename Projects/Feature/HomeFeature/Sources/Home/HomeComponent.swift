import SwiftUI
import FilesDomainInterface
import ApplicationsDomainInterface
import StudentsDomainInterface
import HomeFeatureInterface
import RecruitmentFeatureInterface
import FindCompanyFeatureInterface
import DesignSystem
import NeedleFoundation

public protocol HomeDependency: Dependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase { get }
    var uploadFilesUseCase: any UploadFilesUseCase { get }
    var reApplyCompanyUseCase: any ReApplyCompanyUseCase { get }
    var fetchRejectionReasonUseCase: any FetchRejectionReasonUseCase { get }
    var fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase { get }
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var recruitmentFactory: any RecruitmentFactory { get }
    var findCompanyFactory: any FindCompanyFactory { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView(
            viewModel: .init(
                fetchApplicationUseCase: dependency.fetchApplicationUseCase,
                uploadFilesUseCase: dependency.uploadFilesUseCase,
                fetchTotalPassStudentUseCase: dependency.fetchTotalPassStudentUseCase,
                fetchStudentInfoUseCase: dependency.fetchStudentInfoUseCase,
                reApplyCompanyUseCase: dependency.reApplyCompanyUseCase,
                fetchRejectionReasonUseCase: dependency.fetchRejectionReasonUseCase
            ),
            recruitmentFactory: dependency.recruitmentFactory,
            findCompanyFactory: dependency.findCompanyFactory
        )
        .navigationBarHidden(true)
    }
}
