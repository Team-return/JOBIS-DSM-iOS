import Foundation

public struct BookmarksListResponseDTO: Decodable {
    public let bookmarks: [BookmarkResponseDTO]

    public init(bookmarks: [BookmarkResponseDTO]) {
        self.bookmarks = bookmarks
    }
}

public struct BookmarkResponseDTO: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case recruitmentID = "recruitment_id"
        case createdAt = "created_at"
    }
}

public extension BookmarksListResponseDTO {
    func toDomain() -> BookmarksListEntity {
        BookmarksListEntity(bookmarks: bookmarks.map { $0.toDomain() })
    }
}

public extension BookmarkResponseDTO {
    func toDomain() -> BookmarkEntity {
        BookmarkEntity(
            companyName: companyName,
            recruitmentID: recruitmentID,
            createdAt: createdAt
        )
    }
}
