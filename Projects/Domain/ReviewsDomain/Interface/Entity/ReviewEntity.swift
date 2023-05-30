import Foundation

public struct ReviewEntity: Equatable, Hashable {
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
