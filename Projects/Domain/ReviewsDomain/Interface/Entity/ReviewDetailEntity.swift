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

public struct QnaEntity: Equatable {
    public let question, answer, area: String

    public init(question: String, answer: String, area: String) {
        self.question = question
        self.answer = answer
        self.area = area
    }
}
