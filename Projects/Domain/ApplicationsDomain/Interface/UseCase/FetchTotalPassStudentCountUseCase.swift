import Combine

public protocol FetchTotalPassStudentUseCase {
    func execute() -> AnyPublisher<TotalPassStudentEntity, Error>
}
