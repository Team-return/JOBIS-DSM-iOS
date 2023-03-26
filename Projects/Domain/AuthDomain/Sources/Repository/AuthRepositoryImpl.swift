import AuthDomainInterface
import Combine

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    init(
        remoteAuthDataSource: any RemoteAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, AuthDomainError> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }
}
