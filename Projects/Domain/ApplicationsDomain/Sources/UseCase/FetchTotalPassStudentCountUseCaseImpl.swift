import ApplicationsDomainInterface
import Combine

public struct FetchTotalPassStudentUseCaseImpl: FetchTotalPassStudentUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute() -> AnyPublisher<TotalPassStudentEntity, Error> {
        applicationRepository.fetchTotalPassStudent()
    }
}
