import Foundation

public struct BookmarkListEntity: Equatable {
    public let bookmarks: [BookmarkEntity]

    public init(bookmarks: [BookmarkEntity]) {
        self.bookmarks = bookmarks
    }
}
