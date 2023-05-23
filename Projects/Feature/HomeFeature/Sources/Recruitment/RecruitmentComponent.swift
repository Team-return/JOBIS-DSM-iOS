import SwiftUI
import RecruitmentsDomainInterface
import HomeFeatureInterface
import NeedleFoundation

public protocol RecruitmentDependency: Dependency {
    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase { get }
}

public final class RecruitmentComponent: Component<RecruitmentDependency>, RecruitmentFactory {
    public func makeView() -> some View {
        RecruitmentView(viewModel: .init(
            fetchRecruitmentListUseCase: dependency.fetchRecruitmentListUseCase)
        )
    }
}
