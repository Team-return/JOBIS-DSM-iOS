import Foundation

public struct ReviewEntity: Equatable, Hashable {
    public let reviewID: String
    public let year: Int
    public let writer: String

    public init(reviewID: String, year: Int, writer: String) {
        self.reviewID = reviewID
        self.year = year
        self.writer = writer
    }
}
