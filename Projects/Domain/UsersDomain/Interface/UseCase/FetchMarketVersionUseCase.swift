import Combine

public protocol FetchMarketVersionUseCase {
    func execute() -> AnyPublisher<String, Error>
}
