import AuthDomainInterface
import Combine

public struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> AnyPublisher<ReissueAuthorityEntity, Error> {
        authRepository.reissueToken()
    }
}
