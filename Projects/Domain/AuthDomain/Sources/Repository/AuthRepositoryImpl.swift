import AuthDomainInterface
import Combine

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource
    private let localAuthDataSource: any LocalAuthDataSource

    public init(
        remoteAuthDataSource: any RemoteAuthDataSource,
        localAuthDataSource: any LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }

    public func reissueToken() -> AnyPublisher<Bool, Error> {
        remoteAuthDataSource.reissueToken()
    }

    public func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.verifyAuthCode(email: email, authCode: authCode)
    }

    public func logout() {
        localAuthDataSource.logout()
    }
}
