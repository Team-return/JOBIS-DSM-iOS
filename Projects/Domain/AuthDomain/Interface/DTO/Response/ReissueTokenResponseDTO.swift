import Foundation

public struct ReissueTokenResponseDTO: Decodable {
    public let authority: AuthAuthorityType

    public init(authority: AuthAuthorityType) {
        self.authority = authority
    }
}
