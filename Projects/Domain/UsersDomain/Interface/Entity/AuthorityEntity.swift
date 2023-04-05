import Foundation

public struct AuthorityEntity: Equatable {
    public init(
        authority: AuthorityType
    ) {
        self.authority = authority
    }

    public let authority: AuthorityType
}
