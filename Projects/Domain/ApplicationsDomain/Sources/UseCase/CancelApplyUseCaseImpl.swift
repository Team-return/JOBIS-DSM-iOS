import Combine
import ApplicationsDomainInterface

public struct CancelApplyUseCaseImpl: CancelApplyUseCase {
    private let applicationRepository: any ApplicationRepository

    public init(applicationRepository: any ApplicationRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, Error> {
        applicationRepository.cancelApply(id: id)
    }
}
