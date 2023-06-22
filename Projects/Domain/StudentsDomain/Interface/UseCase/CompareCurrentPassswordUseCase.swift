import Combine

public protocol CompareCurrentPassswordUseCase {
    func execute(password: String) -> AnyPublisher<Void, Error>
}
