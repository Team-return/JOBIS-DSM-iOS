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

public struct QnaResponseDTO: Codable {
    public let question, answer, area: String

    public init(question: String, answer: String, area: String) {
        self.question = question
        self.answer = answer
        self.area = area
    }
}

public extension ReviewDetailResponseDTO {
    func toDomain() -> ReviewDetailEntity {
        ReviewDetailEntity(
            year: year,
            writer: writer,
            createdDate: createdDate,
            qnaResponses: qnaResponses.map { $0.toDomain() }
        )
    }
}

public extension QnaResponseDTO {
    func toDomain() -> QnaEntity {
        QnaEntity(question: question, answer: answer, area: area)
    }
}
