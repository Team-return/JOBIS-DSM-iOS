import UserDomainInterface
import BaseDomain
import Combine

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteAuthDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        request(.signin(req), dto: AuthorityDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
