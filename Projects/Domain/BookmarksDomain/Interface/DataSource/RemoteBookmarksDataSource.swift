import Combine
import Foundation

public protocol RemoteBookmarksDataSource {
    func fetchBookmarkList() -> AnyPublisher<BookmarkListEntity, Error>
    func bookmark(id: Int) -> AnyPublisher<Void, Error>
}
