import Foundation

public struct ReviewListResponseDTO: Codable {
    public let reviews: [ReviewResponseDTO]

    public init(reviews: [ReviewResponseDTO]) {
        self.reviews = reviews
    }
}

public struct ReviewResponseDTO: Codable {
    public let reviewID: String
    public let year: Int
    public let writer, createdDate: String

    public init(
        reviewID: String,
        year: Int,
        writer: String,
        createdDate: String
    ) {
        self.reviewID = reviewID
        self.year = year
        self.writer = writer
        self.createdDate = createdDate
    }

    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case year, writer
        case createdDate = "created_date"
    }
}

public extension ReviewListResponseDTO {
    func toDomain() -> ReviewListEntity {
        ReviewListEntity(reviews: reviews.map { $0.toDomain() })
    }
}

public extension ReviewResponseDTO {
    func toDomain() -> ReviewEntity {
        ReviewEntity(reviewID: reviewID, year: year, writer: writer, createdDate: createdDate)
    }
}
