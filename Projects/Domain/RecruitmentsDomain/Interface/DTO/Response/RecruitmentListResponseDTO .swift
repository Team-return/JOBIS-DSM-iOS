import Foundation

public struct RecruitmentListResponseDTO: Decodable {
    let recruitments: [RecruitmentResponseDTO]
}

public struct RecruitmentResponseDTO: Decodable {
    let recruitID, companyName: String
    let companyProfileURL: String
    let trainPay: Int
    let military: Bool
    let totalHiring: Int
    let jobCodeList: [String]

    enum CodingKeys: String, CodingKey {
        case recruitID = "recruit_id"
        case companyName = "company_name"
        case companyProfileURL = "company_profile_url"
        case trainPay = "train_pay"
        case military
        case totalHiring = "total_hiring"
        case jobCodeList = "job_code_list"
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
            jobCodeList: jobCodeList
        )
    }
}
