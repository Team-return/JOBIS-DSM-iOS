import Foundation

public struct JwtTokenEntity: Equatable {
    public init(
        accessToken: String,
        refreshToken: String,
        expiresAt: String,
        authority: AuthorityType
    ) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresAt = expiresAt
        self.authority = authority
    }

    public let accessToken: String
    public let refreshToken: String
    public let expiresAt: String
    public let authority: AuthorityType
}
