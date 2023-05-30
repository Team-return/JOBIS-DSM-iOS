import Foundation

public struct CodeResponseDTO: Decodable {
    public let code: Int
    public let keyword, jobType: String

    public init(code: Int, keyword: String, jobType: String) {
        self.code = code
        self.keyword = keyword
        self.jobType = jobType
    }

    enum CodingKeys: String, CodingKey {
        case code, keyword
        case jobType = "job_type"
    }
}
