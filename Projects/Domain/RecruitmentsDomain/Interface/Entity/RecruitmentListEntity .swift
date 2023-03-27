import Foundation

public struct RecruitmentListEntity: Equatable {
    let recruitments: [RecruitmentEntity]
}

public struct RecruitmentEntity: Equatable {
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
