import Foundation

public struct ReviewDetailResponseDTO: Codable {
    public let qnaResponses: [QnaResponseDTO]

    public init(
        qnaResponses: [QnaResponseDTO]
    ) {
        self.qnaResponses = qnaResponses
    }

    enum CodingKeys: String, CodingKey {
        case qnaResponses = "qna_responses"
    }
}
