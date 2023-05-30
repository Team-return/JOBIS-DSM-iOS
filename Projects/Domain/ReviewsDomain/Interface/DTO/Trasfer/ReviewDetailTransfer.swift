import Foundation

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
