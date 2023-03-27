import Foundation

public struct TechCodeEntity: Equatable {
    public let code: Int
    public let keyword: String

    public init(code: Int, keyword: String) {
        self.code = code
        self.keyword = keyword
    }
}
