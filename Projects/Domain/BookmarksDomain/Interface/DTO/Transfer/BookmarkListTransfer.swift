import Foundation

public extension BookmarkListResponseDTO {
    func toDomain() -> BookmarkListEntity {
        BookmarkListEntity(bookmarks: bookmarks.map { $0.toDomain() })
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
