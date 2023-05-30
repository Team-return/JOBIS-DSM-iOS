import Foundation

public struct ReviewListResponseDTO: Codable {
    public let reviews: [ReviewResponseDTO]

    public init(reviews: [ReviewResponseDTO]) {
        self.reviews = reviews
    }
}
