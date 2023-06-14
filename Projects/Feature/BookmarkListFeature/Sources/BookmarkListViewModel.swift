import BaseFeature
import Foundation
import Combine
import BookmarksDomainInterface

final class BookmarkListViewModel: BaseViewModel {
    @Published var bookmarkList: [BookmarkEntity] = []
    @Published var isNavigateRecruitmentView: Bool = false
    @Published var isSheetRecruitmentDetail: Bool = false

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
        fetchBookmarkList()
    }

    func deleteBookmark(at offsets: IndexSet) {
        let deletedItems = offsets.map { bookmarkList[$0] } // 삭제된 항목의 값을 가져옴
        bookmarkList.remove(atOffsets: offsets)

        for item in deletedItems {
            bookmark(id: item.recruitmentID)
        }
    }

    private func fetchBookmarkList() {
        addCancellable(
            fetchBookmarkListUseCase.execute()
        ) { [weak self] bookmarkList in
            self?.bookmarkList = bookmarkList.bookmarks
        }
    }

    private func bookmark(id: Int) {
        addCancellable(
            bookmarkUseCase.execute(id: id)
        ) { _ in }
    }
}
