import ReviewsDomainInterface
import BaseDomain
import Combine

public final class RemoteReviewsDataSourceImpl: BaseRemoteDataSource<ReviewsAPI>, RemoteReviewsDataSource {
    public func fetchReviewDetail(id: String) -> AnyPublisher<ReviewsDomainInterface.ReviewDetailEntity, Error> {
        request(.fetchReviewDetail(id: id), dto: ReviewDetailResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchReviewList(id: String) -> AnyPublisher<ReviewsDomainInterface.ReviewListEntity, Error> {
        request(.fetchReviewList(id: id), dto: ReviewListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func postReview(req: ReviewsDomainInterface.PostReviewRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postReview(req))
    }
}
