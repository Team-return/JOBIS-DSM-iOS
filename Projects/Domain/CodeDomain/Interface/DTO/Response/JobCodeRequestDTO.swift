import Foundation

public struct JobCodeRequestDTO: Decodable {
    public let code: Int
    public let keyword: String
    public let jobType: JobType

    public init(code: Int, keyword: String, jobType: JobType) {
        self.code = code
        self.keyword = keyword
        self.jobType = jobType
    }

    enum CodingKeys: String, CodingKey {
        case code
        case keyword
        case jobType = "job_type"
    }
}

public extension [JobCodeRequestDTO] {
    func toDomain() -> [JobCodeEntity] {
        map { $0.toDomain() }
    }
}

public extension JobCodeRequestDTO {
    func toDomain() -> JobCodeEntity {
        JobCodeEntity(
            code: code,
            keyword: keyword,
            jobType: jobType
        )
    }
}
