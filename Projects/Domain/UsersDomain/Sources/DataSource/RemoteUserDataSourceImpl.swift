import UsersDomainInterface
import BaseDomain
import Combine

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        request(.signin(req), dto: AuthorityResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func reissueToken() -> AnyPublisher<Void, Error> {
        request(.reissueToken)
    }
}
