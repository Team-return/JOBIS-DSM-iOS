import Foundation

public struct AuthorityDTO: Decodable {
    public let authority: AuthorityType

    public init(authority: AuthorityType) {
        self.authority = authority
    }
}

public extension AuthorityDTO {
    func toDomain() -> AuthorityEntity {
        AuthorityEntity(authority: authority)
    }
}
