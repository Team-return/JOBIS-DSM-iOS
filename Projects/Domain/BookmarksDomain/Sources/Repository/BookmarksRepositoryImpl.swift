import BookmarksDomainInterface
import Combine

public struct BookmarksRepositoryImpl: BookmarksRepository {
    private let remoteBookmarksDataSource: any RemoteBookmarksDataSource

    public init(
        remoteBookmarksDataSource: any RemoteBookmarksDataSource
    ) {
        self.remoteBookmarksDataSource = remoteBookmarksDataSource
    }

    public func fetchBookmarkList() -> AnyPublisher<BookmarkListEntity, Error> {
        remoteBookmarksDataSource.fetchBookmarkList()
    }

    public func bookmark(id: Int) -> AnyPublisher<Void, Error> {
        remoteBookmarksDataSource.bookmark(id: id)
    }
}
