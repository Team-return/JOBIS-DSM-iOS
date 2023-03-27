import UserDomainInterface
import BaseDomain
import Combine

public struct UserRepositoryImpl: UserRepository {
    private let remoteUserDataSource: any RemoteUserDataSource

    public init(
        remoteUserDataSource: any RemoteUserDataSource
    ) {
        self.remoteUserDataSource = remoteUserDataSource
    }

    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        remoteUserDataSource.signin(req: req)
    }

    public func reissueToken() -> AnyPublisher<Void, Error> {
        remoteUserDataSource.reissueToken()
    }
}
