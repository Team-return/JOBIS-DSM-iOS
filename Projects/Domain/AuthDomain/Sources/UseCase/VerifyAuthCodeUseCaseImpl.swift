import AuthDomainInterface
import Combine

public struct VerifyAuthCodeUseCaseImpl: VerifyAuthCodeUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(email: String, authCode: String) -> AnyPublisher<Void, Error> {
        authRepository.verifyAuthCode(email: email, authCode: authCode)
    }
}
