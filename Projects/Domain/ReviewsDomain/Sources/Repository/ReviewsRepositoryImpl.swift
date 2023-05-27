import ReviewsDomainInterface
import Combine

public struct ReviewsRepositoryImpl: ReviewsRepository {
    private let remoteReviewsDataSource: any RemoteReviewsDataSource

    public init(remoteReviewsDataSource: any RemoteReviewsDataSource) {
        self.remoteReviewsDataSource = remoteReviewsDataSource
    }

    public func fetchReviewDetail(id: String) -> AnyPublisher<ReviewDetailEntity, Error> {
        remoteReviewsDataSource.fetchReviewDetail(id: id)
    }

    public func fetchReviewList(id: String) -> AnyPublisher<ReviewListEntity, Error> {
        remoteReviewsDataSource.fetchReviewList(id: id)
    }

    public func postReview(req: PostReviewRequestDTO) -> AnyPublisher<Void, Error> {
        remoteReviewsDataSource.postReview(req: req)
    }
}
