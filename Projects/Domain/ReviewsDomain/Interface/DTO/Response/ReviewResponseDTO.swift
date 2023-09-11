import Foundation

public struct ReviewResponseDTO: Codable {
    public let reviewID: Int
    public let year: Int
    public let writer: String

    public init(
        reviewID: Int,
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
