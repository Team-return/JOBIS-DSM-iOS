import Foundation

public struct ReviewDetailResponseDTO: Codable {
    public let year: Int
    public let writer: String
    public let qnaResponses: [QnaResponseDTO]

    public init(
        year: Int,
        writer: String,
        qnaResponses: [QnaResponseDTO]
    ) {
        self.year = year
        self.writer = writer
        self.qnaResponses = qnaResponses
    }

    enum CodingKeys: String, CodingKey {
        case year, writer
        case qnaResponses = "qna_responses"
    }
}
