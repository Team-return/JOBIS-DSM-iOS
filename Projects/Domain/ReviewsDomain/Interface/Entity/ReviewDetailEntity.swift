import Foundation

public struct ReviewDetailEntity: Equatable {
    public let year: Int
    public let writer, createdDate: String
    public let qnaResponses: [QnaEntity]

    public init(
        year: Int,
        writer: String,
        createdDate: String,
        qnaResponses: [QnaEntity]
    ) {
        self.year = year
        self.writer = writer
        self.createdDate = createdDate
        self.qnaResponses = qnaResponses
    }
}

