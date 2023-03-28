import UserDomainInterface
import Combine

public struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute() -> AnyPublisher<Void, Error> {
        userRepository.reissueToken()
    }
}
