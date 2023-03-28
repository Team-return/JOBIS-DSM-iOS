import UserDomainInterface
import Combine

public struct LoadJwtTokenUseCaseImpl: LoadJwtTokenUseCase {
    private let localUserRepository: any LocalUserRepository

    public init(localUserRepository: any LocalUserRepository) {
        self.localUserRepository = localUserRepository
    }

    public func execute() -> JwtTokenEntity {
        localUserRepository.loadJwtToken()
    }
}
