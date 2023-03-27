import Combine

public protocol SignupUseCase {
    func execute(req: SignupRequestDto) -> AnyPublisher<Void, Error>
}
