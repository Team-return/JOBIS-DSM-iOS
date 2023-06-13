import Foundation

public extension BookmarkListResponseDTO {
    func toDomain() -> BookmarkListEntity {
        BookmarkListEntity(bookmarks: bookmarks.map { $0.toDomain() })
    }
}

public extension BookmarkResponseDTO {
    func toDomain() -> BookmarkEntity {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"

        var inputDate = inputDateFormatter.date(from: createdAt) ?? Date()
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yyyy-MM-dd"

        let createdAt = outputDateFormatter.string(from: inputDate)

        return BookmarkEntity(
            companyName: companyName,
            recruitmentID: recruitmentID,
            createdAt: createdAt
        )
    }
}
