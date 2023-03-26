import Combine

public protocol CancelApplyUseCase {
    func execute(id: String) -> AnyPublisher<Void, Error>
}
