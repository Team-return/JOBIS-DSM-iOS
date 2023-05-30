import Foundation

public struct QnaEntity: Equatable {
    public let question, answer, area: String

    public init(question: String, answer: String, area: String) {
        self.question = question
        self.answer = answer
        self.area = area
    }
}
