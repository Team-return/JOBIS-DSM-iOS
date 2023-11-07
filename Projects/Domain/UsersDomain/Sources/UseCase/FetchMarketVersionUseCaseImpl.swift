import UsersDomainInterface
import Combine

public struct FetchMarketVersionUseCaseImpl: FetchMarketVersionUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute() -> AnyPublisher<String, Error> {
        usersRepository.fetchMarketingVersion()
    }
}
