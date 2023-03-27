import UserDomainInterface
import BaseDomain
import Combine

public final class RemoteUserDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUserDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        request(.signin(req), dto: AuthorityResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func reissueToken() -> AnyPublisher<Void, Error> {
        request(.reissueToken)
    }
}
