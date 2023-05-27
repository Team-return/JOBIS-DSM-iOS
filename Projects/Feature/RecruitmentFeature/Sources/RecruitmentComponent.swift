import SwiftUI
import RecruitmentsDomainInterface
import HomeFeatureInterface
import BookmarksDomainInterface
import NeedleFoundation

public protocol RecruitmentDependency: Dependency {
    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase { get }
    var bookmarkUseCase: any BookmarkUseCase { get }
}

public final class RecruitmentComponent: Component<RecruitmentDependency>, RecruitmentFactory {
    public func makeView() -> some View {
        RecruitmentView(
            viewModel: .init(
                fetchRecruitmentListUseCase: dependency.fetchRecruitmentListUseCase,
                bookmarkUseCase: dependency.bookmarkUseCase
            )
        )
    }
}
