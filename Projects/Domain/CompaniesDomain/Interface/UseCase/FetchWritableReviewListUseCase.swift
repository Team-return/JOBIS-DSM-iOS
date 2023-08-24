import Combine

public protocol FetchWritableReviewListUseCase {
    func execute() -> AnyPublisher<WritableReviewListEntity, Error>
}
