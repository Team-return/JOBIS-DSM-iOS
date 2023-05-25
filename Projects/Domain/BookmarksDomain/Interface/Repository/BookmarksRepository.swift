import Combine

public protocol BookmarksRepository {
    func fetchBookmarkList() -> AnyPublisher<BookmarksListEntity, Error>
    func bookmark(id: Int) -> AnyPublisher<Void, Error>
}
