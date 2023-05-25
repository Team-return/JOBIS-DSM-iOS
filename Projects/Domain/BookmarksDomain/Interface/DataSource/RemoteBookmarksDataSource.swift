import Combine
import Foundation

public protocol RemoteBookmarksDataSource {
    func fetchBookmarkList() -> AnyPublisher<BookmarksListEntity, Error>
    func bookmark(id: Int) -> AnyPublisher<Void, Error>
}
