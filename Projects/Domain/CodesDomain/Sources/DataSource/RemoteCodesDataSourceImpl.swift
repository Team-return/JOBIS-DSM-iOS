import CodesDomainInterface
import BaseDomain
import Combine

public final class RemoteCodesDataSourceImpl: BaseRemoteDataSource<CodesAPI>, RemoteCodesDataSource {
    public func fetchCodes(
        keyword: String?, type: CodeType, parentCode: String?
    ) -> AnyPublisher<CodeListEntity, Error> {
        request(.fetchCodes(keyword: keyword, type: type, parentCode: parentCode), dto: CodeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
