import Combine
import ApplicationsDomainInterface

public struct ApplyCompanyUseCaseImpl: ApplyCompanyUseCase {
    private let applicationRepository: any ApplicationRepository

    public init(applicationRepository: any ApplicationRepository) {
        self.applicationRepository = applicationRepository
    }

    public func execute(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error> {
        applicationRepository.applyCompany(id: id, req: req)
    }
}
