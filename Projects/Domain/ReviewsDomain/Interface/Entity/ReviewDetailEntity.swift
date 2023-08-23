import Foundation

public struct ReviewDetailEntity: Equatable {
    public let qnaResponses: [QnaEntity]

    public init(
        qnaResponses: [QnaEntity]
    ) {
        self.qnaResponses = qnaResponses
    }
}
