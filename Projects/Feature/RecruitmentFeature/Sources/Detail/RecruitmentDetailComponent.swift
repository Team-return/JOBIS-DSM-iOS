import SwiftUI
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import FindCompanyFeatureInterface
import FilesDomainInterface
import ApplicationsDomainInterface
import NeedleFoundation

public protocol RecruitmentDetailDependency: Dependency {
    var fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase { get }
    var uploadFilesUseCase: any UploadFilesUseCase { get }
    var applyCompanyUseCase: any ApplyCompanyUseCase { get }
    var findCompanyDetailFactory: any FindCompanyDetailFactory { get }
}

public final class RecruitmentDetailComponent: Component<RecruitmentDetailDependency>, RecruitmentDetailFactory {
    public func makeView(id: String, isDetail: Bool) -> some View {
        RecruitmentDetailView(
            viewModel: .init(
                fetchRecruitmentDetailUseCase: dependency.fetchRecruitmentDetailUseCase,
                uploadFilesUseCase: dependency.uploadFilesUseCase,
                applyCompanyUseCase: dependency.applyCompanyUseCase,
                id: id
            ),
            findCompanyDetailFactory: dependency.findCompanyDetailFactory,
            isDetail: isDetail
        )
    }
}
