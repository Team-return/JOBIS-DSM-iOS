import UserDomainInterface
import BaseDomain
import Combine

public struct LocalUserRepositoryImpl: LocalUserRepository {
    private let localUserDataSource: any LocalUserDataSource

    public init(localUserDataSource: any LocalUserDataSource) {
        self.localUserDataSource = localUserDataSource
    }

    public func loadJwtToken() -> JwtTokenEntity {
        localUserDataSource.loadJwtToken()
    }
}
