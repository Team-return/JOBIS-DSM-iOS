import CodesDomainInterface
import BaseDomain
import Combine

public final class RemoteCodesDataSourceImpl: BaseRemoteDataSource<CodesAPI>, RemoteCodesDataSource {
    public func fetchCodes(keyword: String, type: CodeType) -> AnyPublisher<CodeListEntity, Error> {
        request(.fetchCodes(keyword: keyword, type: type), dto: CodeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
