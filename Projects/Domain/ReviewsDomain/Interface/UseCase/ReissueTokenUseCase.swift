import Combine

public protocol FetchReviewDetailUseCase {
    func execute(id: String) -> AnyPublisher<ReviewDetailEntity, Error>
}
