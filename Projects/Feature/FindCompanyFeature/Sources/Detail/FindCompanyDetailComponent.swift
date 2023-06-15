import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import ReviewsDomainInterface
import RecruitmentFeatureInterface
import NeedleFoundation

public protocol FindCompanyDetailDependency: Dependency {
    var fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase { get }
    var fetchReviewListUseCase: any FetchReviewListUseCase { get }
    var recruitmentDetailFactory: any RecruitmentDetailFactory { get }
}

public final class FindCompanyDetailComponent: Component<FindCompanyDetailDependency>, FindCompanyDetailFactory {
    public func makeView(id: String, isDetail: Bool) -> some View {
        FindCompanyDetailView(
            viewModel: .init(
                fetchCompanyInfoDetailUseCase: dependency.fetchCompanyInfoDetailUseCase,
                fetchReviewListUseCase: dependency.fetchReviewListUseCase,
                id: id
            ),
            recruitmentDetailFactory: dependency.recruitmentDetailFactory,
            isDetail: isDetail
        )
    }
}
