import Foundation

public struct AuthorityResponseDTO: Decodable {
    public let authority: AuthorityType

    public init(authority: AuthorityType) {
        self.authority = authority
    }
}

public extension AuthorityResponseDTO {
    func toDomain() -> AuthorityEntity {
        AuthorityEntity(authority: authority)
    }
}
