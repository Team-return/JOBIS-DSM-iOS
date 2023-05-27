import Combine

public protocol FetchReviewListUseCase {
    func execute(id: String) -> AnyPublisher<ReviewListEntity, Error>
}
