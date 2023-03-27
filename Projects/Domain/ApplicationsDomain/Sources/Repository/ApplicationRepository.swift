import ApplicationsDomainInterface
import Combine

public struct ApplicationsRepositoryImpl: ApplicationsRepository {
    private let remoteApplicationsDataSource: any RemoteApplicationsDataSource

    public init(
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
