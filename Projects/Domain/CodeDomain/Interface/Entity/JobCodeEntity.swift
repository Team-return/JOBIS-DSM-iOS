import Foundation

public struct JobCodeEntity: Equatable {
    public let code: Int
    public let keyword: String
    public let jobType: JobType

    public init(code: Int, keyword: String, jobType: JobType) {
        self.code = code
        self.keyword = keyword
        self.jobType = jobType
    }
}
