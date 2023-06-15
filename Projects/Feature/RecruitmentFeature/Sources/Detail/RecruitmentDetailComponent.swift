import SwiftUI
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import FindCompanyFeatureInterface
import NeedleFoundation

public protocol RecruitmentDetailDependency: Dependency {
    var fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase { get }
    var findCompanyDetailFactory: any FindCompanyDetailFactory { get }
}

public final class RecruitmentDetailComponent: Component<RecruitmentDetailDependency>, RecruitmentDetailFactory {
    public func makeView(id: String) -> some View {
        RecruitmentDetailView(
            viewModel: .init(
                fetchRecruitmentDetailUseCase: dependency.fetchRecruitmentDetailUseCase,
                id: id
            ),
            findCompanyDetailFactory: dependency.findCompanyDetailFactory
        )
    }
}
