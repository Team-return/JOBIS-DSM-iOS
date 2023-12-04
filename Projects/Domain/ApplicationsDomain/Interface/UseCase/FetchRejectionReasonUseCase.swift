import Combine

public protocol FetchRejectionReasonUseCase {
    func execute(id: String) -> AnyPublisher<String, Error>
}
