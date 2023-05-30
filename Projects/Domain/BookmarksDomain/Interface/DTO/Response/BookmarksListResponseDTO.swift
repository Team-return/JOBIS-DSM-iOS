import Foundation

public struct BookmarkListResponseDTO: Decodable {
    public let bookmarks: [BookmarkResponseDTO]

    public init(bookmarks: [BookmarkResponseDTO]) {
        self.bookmarks = bookmarks
    }
}
