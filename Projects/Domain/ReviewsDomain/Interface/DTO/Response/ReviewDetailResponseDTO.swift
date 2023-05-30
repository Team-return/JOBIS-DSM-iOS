import Foundation

public struct ReviewDetailResponseDTO: Codable {
    public let year: Int
    public let writer, createdDate: String
    public let qnaResponses: [QnaResponseDTO]

    public init(
        year: Int,
        writer: String,
        createdDate: String,
        qnaResponses: [QnaResponseDTO]
    ) {
        self.year = year
        self.writer = writer
        self.createdDate = createdDate
        self.qnaResponses = qnaResponses
    }

    enum CodingKeys: String, CodingKey {
        case year, writer
        case createdDate = "created_date"
        case qnaResponses = "qna_responses"
    }
}
