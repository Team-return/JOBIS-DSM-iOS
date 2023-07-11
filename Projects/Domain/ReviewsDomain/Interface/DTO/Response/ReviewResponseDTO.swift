import Foundation

public struct ReviewResponseDTO: Codable {
    public let reviewID: String
    public let year: Int
    public let writer: String

    public init(
        reviewID: String,
        year: Int,
        writer: String
    ) {
        self.reviewID = reviewID
        self.year = year
        self.writer = writer
    }

    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case year
        case writer
    }
}
