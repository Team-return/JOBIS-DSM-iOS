import Combine
import Foundation

public protocol ReviewsRepository {
    func fetchReviewDetail(id: String) -> AnyPublisher<ReviewDetailEntity, Error>
    func fetchReviewList(id: String) -> AnyPublisher<ReviewListEntity, Error>
    func postReview(req: PostReviewRequestDTO) -> AnyPublisher<Void, Error>
}
