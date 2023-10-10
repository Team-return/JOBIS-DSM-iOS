import Foundation

public extension ReissueTokenResponseDTO {
    func toDomain() -> ReissueAuthorityEntity {
        ReissueAuthorityEntity(authority: authority)
    }
}
