import SwiftUI
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import NeedleFoundation

public protocol RecruitmentDetailDependency: Dependency {
    var fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase { get }
}

public final class RecruitmentDetailComponent: Component<RecruitmentDetailDependency>, RecruitmentDetailFactory {
    public func makeView(id: String, profileURL: String, companyName: String) -> some View {
        RecruitmentDetailView(
            viewModel: .init(
                fetchRecruitmentDetailUseCase: dependency.fetchRecruitmentDetailUseCase,
                id: id
            ),
            profileURL: profileURL,
            companyName: companyName
        )
    }
}
