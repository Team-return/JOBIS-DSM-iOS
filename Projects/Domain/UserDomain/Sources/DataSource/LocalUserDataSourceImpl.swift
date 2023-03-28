import UserDomainInterface
import Combine
import JwtStoreInterface

public struct LocalUserDataSourceImpl: LocalUserDataSource {
    private let keychain: any Keychain

    public init(keychain: any Keychain) {
        self.keychain = keychain
    }

    public func loadJwtToken() -> JwtTokenEntity {
        JwtTokenEntity(
            accessToken: keychain.load(type: .accessToken),
            refreshToken: keychain.load(type: .refreshToken),
            expiresAt: keychain.load(type: .accessExpiresAt)
        )
    }
}
