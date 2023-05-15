import CodesDomainInterface
import BaseDomain
import Combine

public final class RemoteCodesDataSourceImpl: BaseRemoteDataSource<CodesAPI>, RemoteCodesDataSource {
    public func fetchCodes(keyword: String, type: CodeType) -> AnyPublisher<CodeEntity, Error> {
        request(.fetchCodes(keyword: keyword, type: type), dto: CodesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
