import Foundation

public struct AuthorityResponseDTO: Decodable {
    public let authority: AuthorityType

    public init(authority: AuthorityType) {
        self.authority = authority
    }
}
