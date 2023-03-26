import CodeDomainInterface
import BaseDomain
import Combine

public final class RemoteCodeDataSourceImpl: BaseRemoteDataSource<CodeAPI>, RemoteCodeDataSource {
    public func fetchJobCode() -> AnyPublisher<CodeDomainInterface.JobCodeEntity, Error> {
        request(.fetchJobCode, dto: JobCodeRequestDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchTechCode(keyword: String) -> AnyPublisher<CodeDomainInterface.TechCodeEntity, Error> {
        request(.fetchTechCode(keyword: keyword), dto: TechCodeRequestDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
