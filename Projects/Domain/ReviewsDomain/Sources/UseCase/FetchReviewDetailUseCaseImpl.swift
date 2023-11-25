import ReviewsDomainInterface
import Combine

public struct FetchReviewDetailUseCaseImpl: FetchReviewDetailUseCase {
    private let reviewsRepository: any ReviewsRepository

    public init(reviewsRepository: any ReviewsRepository) {
        self.reviewsRepository = reviewsRepository
    }

    public func execute(id: String) -> AnyPublisher<ReviewDetailEntity, Error> {
        reviewsRepository.fetchReviewDetail(id: id)
    }
}
