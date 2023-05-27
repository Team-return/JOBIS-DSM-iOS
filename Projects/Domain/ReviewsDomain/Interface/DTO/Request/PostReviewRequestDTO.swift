import Foundation

public struct PostReviewRequestDTO: Encodable {
    public let companyID: Int
    public let qnaElements: [QnaElementRequestDTO]
    public let applicationID: Int

    public init(
        companyID: Int,
        qnaElements: [QnaElementRequestDTO],
        applicationID: Int
    ) {
        self.companyID = companyID
        self.qnaElements = qnaElements
        self.applicationID = applicationID
    }

    enum CodingKeys: String, CodingKey {
        case companyID = "company_id"
        case qnaElements = "qna_elements"
        case applicationID = "application_id"
    }
}

public struct QnaElementRequestDTO: Encodable {
    public let question, answer: String
    public let codeID: Int

    public init(question: String, answer: String, codeID: Int) {
        self.question = question
        self.answer = answer
        self.codeID = codeID
    }

    enum CodingKeys: String, CodingKey {
        case question, answer
        case codeID = "code_id"
    }
}
