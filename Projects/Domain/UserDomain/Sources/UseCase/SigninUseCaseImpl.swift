import UserDomainInterface
import Combine

public struct SigninUseCaseImpl: SigninUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        userRepository.signin(req: req)
    }
}
