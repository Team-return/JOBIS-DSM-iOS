import Foundation

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
