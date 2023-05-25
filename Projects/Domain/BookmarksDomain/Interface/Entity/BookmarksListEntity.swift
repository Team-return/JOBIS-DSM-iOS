import Foundation

public struct BookmarksListEntity: Equatable {
    public let bookmarks: [BookmarkEntity]

    public init(bookmarks: [BookmarkEntity]) {
        self.bookmarks = bookmarks
    }
}

public struct BookmarkEntity: Equatable {
    public let companyName: String
    public let recruitmentID: Int
    public let createdAt: String

    public init(
        companyName: String,
        recruitmentID: Int,
        createdAt: String
    ) {
        self.companyName = companyName
        self.recruitmentID = recruitmentID
        self.createdAt = createdAt
    }
}
