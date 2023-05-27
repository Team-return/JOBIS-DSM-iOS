import Foundation

public struct RecruitmentListResponseDTO: Codable {
    public let recruitments: [RecruitmentResponseDTO]

    public init(recruitments: [RecruitmentResponseDTO]) {
        self.recruitments = recruitments
    }
}

public struct RecruitmentResponseDTO: Codable {
    public let recruitID: Int
    public let companyName: String
    public let companyProfileURL: String
    public let trainPay: Int
    public let military: Bool
    public let totalHiring: Int
    public let jobCodeList: String
    public let bookmarked: Bool

    public init(
        recruitID: Int,
        companyName: String,
        companyProfileURL: String,
        trainPay: Int,
        military: Bool,
        totalHiring: Int,
        jobCodeList: String,
        bookmarked: Bool
    ) {
        self.recruitID = recruitID
        self.companyName = companyName
        self.companyProfileURL = companyProfileURL
        self.trainPay = trainPay
        self.military = military
        self.totalHiring = totalHiring
        self.jobCodeList = jobCodeList
        self.bookmarked = bookmarked
    }

    enum CodingKeys: String, CodingKey {
        case recruitID = "recruit_id"
        case companyName = "company_name"
        case companyProfileURL = "company_profile_url"
        case trainPay = "train_pay"
        case military
        case totalHiring = "total_hiring"
        case jobCodeList = "job_code_list"
        case bookmarked
    }
}

public extension RecruitmentListResponseDTO {
    func toDomain() -> RecruitmentListEntity {
        RecruitmentListEntity(recruitments: recruitments.map { $0.toDomain() })
    }
}

public extension RecruitmentResponseDTO {
    func toDomain() -> RecruitmentEntity {
        RecruitmentEntity(
            recruitID: recruitID,
            companyName: companyName,
            companyProfileURL: companyProfileURL,
            trainPay: trainPay,
            military: military,
            totalHiring: totalHiring,
            jobCodeList: jobCodeList,
            bookmarked: bookmarked
        )
    }
}
