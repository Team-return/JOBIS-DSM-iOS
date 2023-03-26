import UserDomainInterface
import BaseDomain
import Combine

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource
    private let localAuthDataSource: any LocalAuthDataSource

    init(
        remoteAuthDataSource: any RemoteAuthDataSource,
        localAuthDataSource: any LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    func signin(req: SigninRequestDTO) -> AnyPublisher<AuthorityEntity, Error> {
        remoteAuthDataSource.signin(req: req)
    }

    func loadJwtToken() -> JwtTokenEntity {
        localAuthDataSource.loadJwtToken()
    }
}
