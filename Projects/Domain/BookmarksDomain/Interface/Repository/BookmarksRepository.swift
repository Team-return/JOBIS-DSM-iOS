import Combine

public protocol BookmarksRepository {
    func fetchBookmarkList() -> AnyPublisher<BookmarkListEntity, Error>
    func bookmark(id: Int) -> AnyPublisher<Void, Error>
}
