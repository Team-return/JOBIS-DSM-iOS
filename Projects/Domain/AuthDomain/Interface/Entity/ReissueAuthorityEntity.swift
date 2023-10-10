import Foundation

public struct ReissueAuthorityEntity: Equatable {
    public let authority: AuthAuthorityType

    public init(authority: AuthAuthorityType) {
        self.authority = authority
    }
}
