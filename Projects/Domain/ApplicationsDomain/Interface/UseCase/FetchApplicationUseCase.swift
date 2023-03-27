import Combine

public protocol FetchApplicationUseCase {
    func execute() -> AnyPublisher<[ApplicationEntity], Error>
}
