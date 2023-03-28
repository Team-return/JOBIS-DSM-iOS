import Combine

public protocol ReissueTokenUseCase {
    func execute() -> AnyPublisher<Void, Error>
}
