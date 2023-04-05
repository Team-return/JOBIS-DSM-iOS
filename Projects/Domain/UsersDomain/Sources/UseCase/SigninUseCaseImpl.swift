import UsersDomainInterface
import Combine

public struct SigninUseCaseImpl: SigninUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        usersRepository.signin(req: req)
    }
}
