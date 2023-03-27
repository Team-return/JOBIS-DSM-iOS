import UserDomainInterface
import Combine

struct LoadJwtTokenUseCaseImpl: LoadJwtTokenUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> JwtTokenEntity {
        authRepository.loadJwtToken()
    }
}
