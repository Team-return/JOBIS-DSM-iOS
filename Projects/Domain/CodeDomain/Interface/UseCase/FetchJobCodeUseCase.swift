import Combine

public protocol FetchJobCodeUseCase {
    func execute() -> AnyPublisher<JobCodeEntity, Error>
}
