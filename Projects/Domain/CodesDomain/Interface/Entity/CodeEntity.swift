import Foundation

public struct CodeEntity: Equatable {
    public let code: Int
    public let keyword, jobType: String

    public init(code: Int, keyword: String, jobType: String) {
        self.code = code
        self.keyword = keyword
        self.jobType = jobType
    }
}
