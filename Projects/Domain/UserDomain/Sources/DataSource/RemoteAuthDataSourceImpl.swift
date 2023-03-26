import UserDomainInterface
import BaseDomain
import Combine

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteAuthDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<Void, UserDomainError> {
        request(.signin(req))
            .mapError { $0 as? JobisError ?? .unknown }
            .eraseToAnyPublisher()
    }
}
