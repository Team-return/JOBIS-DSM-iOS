import Foundation

public extension ReissueTokenResponseDTO {
    func toDomain() -> Bool {
        return authority == .developer
    }
}
