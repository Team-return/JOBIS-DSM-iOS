import SwiftUI
import RecruitmentsDomainInterface
import RecruitmentFeatureInterface
import BookmarksDomainInterface
import CodesDomainInterface
import NeedleFoundation

public protocol RecruitmentDependency: Dependency {
    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase { get }
    var bookmarkUseCase: any BookmarkUseCase { get }
    var fetchCodesUseCase: any FetchCodesUseCase { get }
    var recruitmentDetailFactory: any RecruitmentDetailFactory { get }
}

public final class RecruitmentComponent: Component<RecruitmentDependency>, RecruitmentFactory {
    public func makeView(winterIntern: Bool) -> some View {
        RecruitmentView(
            viewModel: .init(
                fetchCodeUseCase: dependency.fetchCodesUseCase,
                fetchRecruitmentListUseCase: dependency.fetchRecruitmentListUseCase,
                bookmarkUseCase: dependency.bookmarkUseCase,
                winterIntern: winterIntern
            ),
            recruitmentDetailFactory: dependency.recruitmentDetailFactory
        )
    }
}
