import Combine
import ApplicationsDomainInterface

public struct CancelApplyUseCaseImpl: CancelApplyUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, Error> {
        applicationRepository.cancelApply(id: id)
    }
}
