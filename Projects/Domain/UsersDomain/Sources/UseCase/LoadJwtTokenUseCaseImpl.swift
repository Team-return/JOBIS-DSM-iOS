import UsersDomainInterface
import Combine

public struct LoadJwtTokenUseCaseImpl: LoadJwtTokenUseCase {
    private let localUsersRepository: any LocalUsersRepository

    public init(localUsersRepository: any LocalUsersRepository) {
        self.localUsersRepository = localUsersRepository
    }

    public func execute() -> JwtTokenEntity {
        localUsersRepository.loadJwtToken()
    }
}
