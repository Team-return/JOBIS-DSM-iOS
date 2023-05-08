import AuthDomainInterface
import Combine

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    public init(
        remoteAuthDataSource: any RemoteAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }

    public func reissueToken() -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.reissueToken()
    }

    public func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.verifyAuthCode(email: email, authCode: authCode)
    }
}
