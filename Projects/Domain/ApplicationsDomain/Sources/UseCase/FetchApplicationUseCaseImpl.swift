import ApplicationsDomainInterface
import Combine

public struct FetchApplicationUseCaseImpl: FetchApplicationUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute() -> AnyPublisher<ApplicationListEntity, Error> {
        applicationRepository.fetchApplication()
    }
}
