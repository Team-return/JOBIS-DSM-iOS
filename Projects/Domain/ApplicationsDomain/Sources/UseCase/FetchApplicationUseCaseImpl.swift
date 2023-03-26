import ApplicationsDomainInterface
import Combine

public struct FetchApplicationUseCaseImpl: FetchApplicationUseCase {
    private let applicationRepository: any ApplicationRepository

    public init(applicationRepository: any ApplicationRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute() -> AnyPublisher<[ApplicationEntity], Error> {
        applicationRepository.fetchApplication()
    }
}
