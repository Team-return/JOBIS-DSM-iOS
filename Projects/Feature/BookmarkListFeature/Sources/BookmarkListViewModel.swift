import BaseFeature
import Foundation
import Combine
import BookmarksDomainInterface

final class BookmarkListViewModel: BaseViewModel {
    @Published var bookmarkList: [BookmarkEntity] = []
    @Published var isNavigateRecruitmentView: Bool = false
    @Published var isSheetRecruitmentDetail: Bool = false
    @Published var isFetchingBookmarkList: Bool = true

    private let fetchBookmarkListUseCase: FetchBookmarkListUseCase
    private let bookmarkUseCase: BookmarkUseCase

    public init(
        fetchBookmarkListUseCase: FetchBookmarkListUseCase,
        bookmarkUseCase: BookmarkUseCase
    ) {
        self.fetchBookmarkListUseCase = fetchBookmarkListUseCase
        self.bookmarkUseCase = bookmarkUseCase
    }

    func onAppear() {
        self.isFetchingBookmarkList = true
        fetchBookmarkList()
    }

    func deleteBookmark(at offsets: IndexSet) {
        bookmarkList.remove(atOffsets: offsets)

        let deletedItems = offsets.map { bookmarkList[$0] }
        for item in deletedItems {
            bookmark(id: item.recruitmentID)
        }
    }

    private func fetchBookmarkList() {
        addCancellable(
            fetchBookmarkListUseCase.execute()
        ) { [weak self] bookmarkList in
            self?.bookmarkList = bookmarkList.bookmarks
            self?.isFetchingBookmarkList = false
        }
    }

    private func bookmark(id: Int) {
        addCancellable(
            bookmarkUseCase.execute(id: id)
        ) { _ in }
    }
}
