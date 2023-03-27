import ApplicationsDomainInterface
import Combine

struct ApplicationRepositoryImpl: ApplicationRepository {
    private let remoteApplicationsDataSource: any RemoteApplicationsDataSource

    init(
        remoteApplicationsDataSource: any RemoteApplicationsDataSource
    ) {
        self.remoteApplicationsDataSource = remoteApplicationsDataSource
    }

    public func applyCompany(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error> {
        remoteApplicationsDataSource.applyCompany(id: id, req: req )
    }

    public func cancelApply(id: String) -> AnyPublisher<Void, Error> {
        remoteApplicationsDataSource.cancelApply(id: id)
    }

    public func fetchApplication() -> AnyPublisher<[ApplicationEntity], Error> {
        remoteApplicationsDataSource.fetchApplication()
    }
}
