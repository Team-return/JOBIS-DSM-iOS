import UserDomainInterface
import BaseDomain
import Combine

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteAuthDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        request(.signin(req), dto: AuthorityResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
