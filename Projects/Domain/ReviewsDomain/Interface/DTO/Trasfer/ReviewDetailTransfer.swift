import Foundation

public extension ReviewDetailResponseDTO {
    func toDomain() -> ReviewDetailEntity {
        ReviewDetailEntity(
            qnaResponses: qnaResponses.map { $0.toDomain() }
        )
    }
}

public extension QnaResponseDTO {
    func toDomain() -> QnaEntity {
        QnaEntity(question: question, answer: answer, area: area)
    }
}
