import Combine

public protocol FetchBookmarkListUseCase {
    func execute() -> AnyPublisher<BookmarkListEntity, Error>
}
