import UsersDomainInterface
import BaseDomain
import Combine

public struct LocalUsersRepositoryImpl: LocalUsersRepository {
    private let localUsersDataSource: any LocalUsersDataSource

    public init(localUsersDataSource: any LocalUsersDataSource) {
        self.localUsersDataSource = localUsersDataSource
    }

    public func loadJwtToken() -> JwtTokenEntity {
        localUsersDataSource.loadJwtToken()
    }
}
