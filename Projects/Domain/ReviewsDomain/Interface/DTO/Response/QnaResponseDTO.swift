import Foundation

public struct QnaResponseDTO: Codable {
    public let question, answer, area: String

    public init(question: String, answer: String, area: String) {
        self.question = question
        self.answer = answer
        self.area = area
    }
}
