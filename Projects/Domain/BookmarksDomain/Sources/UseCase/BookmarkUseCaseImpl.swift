import Combine
import BookmarksDomainInterface

public struct BookmarkUseCaseImpl: BookmarkUseCase {
    private let bookmarksRepository: any BookmarksRepository

    public init(bookmarksRepository: any BookmarksRepository) {
        self.bookmarksRepository = bookmarksRepository
    }

    public func execute(id: Int) -> AnyPublisher<Void, Error> {
        bookmarksRepository.bookmark(id: id)
    }
}
