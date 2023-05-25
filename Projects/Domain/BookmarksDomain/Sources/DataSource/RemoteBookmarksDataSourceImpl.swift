import BookmarksDomainInterface
import BaseDomain
import Combine

public final class RemoteBookmarksDataSourceImpl: BaseRemoteDataSource<BookmarksDomain>,
                                                  RemoteBookmarksDataSource {
    public func fetchBookmarkList() -> AnyPublisher<BookmarksListEntity, Error> {
        request(.fetchBookmarkList, dto: BookmarksListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func bookmark(id: Int) -> AnyPublisher<Void, Error> {
        request(.bookmark(id: id))
    }
}
