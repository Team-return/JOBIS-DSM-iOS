import ApplicationsDomainInterface
import Combine

public struct FetchRejectionReasonUseCaseImpl: FetchRejectionReasonUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String) -> AnyPublisher<String, Error> {
        applicationRepository.fetchRejectionReason(id: id)
    }
}
