import UserDomainInterface
import Combine

struct SigninUseCaseImpl: SigninUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        authRepository.signin(req: req)
    }
}
