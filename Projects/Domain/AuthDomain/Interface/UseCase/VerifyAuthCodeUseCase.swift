import Combine

public protocol VerifyAuthCodeUseCase {
    func execute(email: String, authCode: String) -> AnyPublisher<Void, Error>
}
