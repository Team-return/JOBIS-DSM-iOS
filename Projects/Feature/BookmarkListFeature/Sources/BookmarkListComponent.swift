import SwiftUI
import BookmarkListFeatureInterface
import BookmarksDomainInterface
import RecruitmentFeatureInterface
import NeedleFoundation

public protocol BookmarkListDependency: Dependency {
    var fetchBookmarkListUseCase: any FetchBookmarkListUseCase { get }
    var bookmarkUseCase: any BookmarkUseCase { get }
    var recruitmentFactory: any RecruitmentFactory { get }
    var recruitmentDetailFactory: any RecruitmentDetailFactory { get }
}

public final class BookmarkListComponent: Component<BookmarkListDependency>, BookmarkListFactory {
    public func makeView() -> some View {
        NavigationView {
            BookmarkListView(
                viewModel: .init(
                    fetchBookmarkListUseCase: dependency.fetchBookmarkListUseCase,
                    bookmarkUseCase: dependency.bookmarkUseCase
                ),
                recruitmentFactory: dependency.recruitmentFactory,
                recruitmentDetailFactory: dependency.recruitmentDetailFactory
            )
        }
    }
}
