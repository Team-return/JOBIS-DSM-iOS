import Foundation

public struct ReviewListEntity: Equatable {
    public let reviews: [ReviewEntity]

    public init(reviews: [ReviewEntity]) {
        self.reviews = reviews
    }
}

public struct ReviewEntity: Equatable {
    public let reviewID: String
    public let year: Int
    public let writer, createdDate: String

    public init(reviewID: String, year: Int, writer: String, createdDate: String) {
        self.reviewID = reviewID
        self.year = year
        self.writer = writer
        self.createdDate = createdDate
    }
}
