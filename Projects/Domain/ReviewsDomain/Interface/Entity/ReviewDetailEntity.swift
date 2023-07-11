import Foundation

public struct ReviewDetailEntity: Equatable {
    public let year: Int
    public let writer: String
    public let qnaResponses: [QnaEntity]

    public init(
        year: Int,
        writer: String,
        qnaResponses: [QnaEntity]
    ) {
        self.year = year
        self.writer = writer
        self.qnaResponses = qnaResponses
    }
}
