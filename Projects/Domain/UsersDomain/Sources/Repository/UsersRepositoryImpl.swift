import UsersDomainInterface
import BaseDomain
import Combine

public struct UsersRepositoryImpl: UsersRepository {
    private let remoteUsersDataSource: any RemoteUsersDataSource

    public init(
        remoteUsersDataSource: any RemoteUsersDataSource
    ) {
        self.remoteUsersDataSource = remoteUsersDataSource
    }

    public func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        remoteUsersDataSource.signin(req: req)
    }
}
