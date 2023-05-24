import ApplicationsDomainInterface
import BaseDomain
import Combine

public final class RemoteApplicationsDataSourceImpl: BaseRemoteDataSource<ApplicationsAPI>,
                                                        RemoteApplicationsDataSource {
    public func applyCompany(id: String, req: ApplyCompanyRequestDTO) -> AnyPublisher<Void, Error> {
        request(.applyCompany(id: id, req))
    }

    public func cancelApply(id: String) -> AnyPublisher<Void, Error> {
        request(.cancelApply(id: id))
    }

    public func fetchApplication() -> AnyPublisher<ApplicationListEntity, Error> {
        request(.fetchApplication, dto: ApplicationListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
