import Combine
import ApplicationsDomainInterface

public struct ApplyCompanyUseCaseImpl: ApplyCompanyUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error> {
        applicationRepository.applyCompany(id: id, req: req)
    }
}
