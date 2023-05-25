import Combine
import BookmarksDomainInterface

public struct FetchBookmarkListUseCaseImpl: FetchBookmarkListUseCase {
    private let bookmarksRepository: any BookmarksRepository

    public init(bookmarksRepository: any BookmarksRepository) {
        self.bookmarksRepository = bookmarksRepository
    }

    public func execute() -> AnyPublisher<BookmarksListEntity, Error> {
        bookmarksRepository.fetchBookmarkList()
    }
}
