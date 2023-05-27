import Combine

public protocol PostReviewUseCase {
    func execute(req: PostReviewRequestDTO) -> AnyPublisher<Void, Error>
}
