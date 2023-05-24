import Combine

public protocol FetchApplicationUseCase {
    func execute() -> AnyPublisher<ApplicationListEntity, Error>
}
