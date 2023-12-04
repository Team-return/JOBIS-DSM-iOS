import Combine
import ApplicationsDomainInterface

public struct ReApplyCompanyUseCaseImpl: ReApplyCompanyUseCase {
    private let applicationRepository: any ApplicationsRepository

    public init(applicationRepository: any ApplicationsRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error> {
        applicationRepository.reApplyCompany(id: id, req: req)
    }
}
