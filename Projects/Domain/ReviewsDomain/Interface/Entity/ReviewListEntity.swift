import Foundation

public struct ReviewListEntity: Equatable {
    public let reviews: [ReviewEntity]

    public init(reviews: [ReviewEntity]) {
        self.reviews = reviews
    }
}
