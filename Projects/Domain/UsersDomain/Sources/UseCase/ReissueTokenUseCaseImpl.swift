import UsersDomainInterface
import Combine

public struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute() -> AnyPublisher<Void, Error> {
        usersRepository.reissueToken()
    }
}
