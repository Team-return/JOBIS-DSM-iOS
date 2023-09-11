import AuthDomainInterface
import UsersDomainInterface
import Combine

public struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> AnyPublisher<Bool, Error> {
        authRepository.reissueToken()
    }
}
