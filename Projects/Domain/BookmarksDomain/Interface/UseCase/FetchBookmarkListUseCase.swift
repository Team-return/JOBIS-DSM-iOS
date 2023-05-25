import Combine

public protocol FetchBookmarkListUseCase {
    func execute() -> AnyPublisher<BookmarksListEntity, Error>
}
