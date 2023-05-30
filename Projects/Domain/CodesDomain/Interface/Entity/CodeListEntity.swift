import Foundation

public struct CodeListEntity: Equatable {
    public let codes: [CodeEntity]

    public init(codes: [CodeEntity]) {
        self.codes = codes
    }
}
