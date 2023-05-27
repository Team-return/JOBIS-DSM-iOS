import ReviewsDomainInterface
import Combine

public struct PostReviewUseCaseImpl: PostReviewUseCase {
    private let reviewsRepository: any ReviewsRepository

    public init(reviewsRepository: any ReviewsRepository) {
        self.reviewsRepository = reviewsRepository
    }

    public func execute(req: PostReviewRequestDTO) -> AnyPublisher<Void, Error> {
        reviewsRepository.postReview(req: req
        )
    }
}
