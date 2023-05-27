import ReviewsDomainInterface
import Combine

public struct FetchReviewListUseCaseImpl: FetchReviewListUseCase {
    private let reviewsRepository: any ReviewsRepository

    public init(reviewsRepository: any ReviewsRepository) {
        self.reviewsRepository = reviewsRepository
    }

    public func execute(id: String) -> AnyPublisher<ReviewListEntity, Error> {
        reviewsRepository.fetchReviewList(id: id)
    }
}
