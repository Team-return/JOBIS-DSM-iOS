import Foundation

public extension AuthorityResponseDTO {
    func toDomain() -> AuthorityEntity {
        AuthorityEntity(authority: authority)
    }
}
