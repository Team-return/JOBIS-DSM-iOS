import Foundation

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
