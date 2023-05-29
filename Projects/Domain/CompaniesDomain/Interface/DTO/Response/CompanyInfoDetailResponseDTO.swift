import Foundation

public struct CompanyInfoDetailResponseDTO: Decodable {
    public let businessNumber: String
    public let companyName: String
    public let companyProfileURL: String
    public let companyIntroduce, zipCode1, address1: String
    public let zipCode2, address2: String?
    public let manager1, phoneNumber1: String
    public let manager2, phoneNumber2, fax: String?
    public let email, representativeName, foundedAt: String
    public let workerNumber: Int
    public let take: Double
    public let recruitmentID: Int?

    public init(
        businessNumber: String,
        companyName: String,
        companyProfileURL: String,
        companyIntroduce: String,
        zipCode1: String,
        address1: String,
        zipCode2: String?,
        address2: String?,
        manager1: String,
        phoneNumber1: String,
        manager2: String?,
        phoneNumber2: String?,
        fax: String?,
        email: String,
        representativeName: String,
        foundedAt: String,
        workerNumber: Int,
        take: Double,
        recruitmentID: Int?
    ) {
        self.businessNumber = businessNumber
        self.companyName = companyName
        self.companyProfileURL = companyProfileURL
        self.companyIntroduce = companyIntroduce
        self.zipCode1 = zipCode1
        self.address1 = address1
        self.zipCode2 = zipCode2
        self.address2 = address2
        self.manager1 = manager1
        self.phoneNumber1 = phoneNumber1
        self.manager2 = manager2
        self.phoneNumber2 = phoneNumber2
        self.fax = fax
        self.email = email
        self.representativeName = representativeName
        self.foundedAt = foundedAt
        self.workerNumber = workerNumber
        self.take = take
        self.recruitmentID = recruitmentID
    }

    enum CodingKeys: String, CodingKey {
        case businessNumber = "business_number"
        case companyName = "company_name"
        case companyProfileURL = "company_profile_url"
        case companyIntroduce = "company_introduce"
        case zipCode1 = "zip_code1"
        case address1
        case zipCode2 = "zip_code2"
        case address2, manager1
        case phoneNumber1 = "phone_number1"
        case manager2
        case phoneNumber2 = "phone_number2"
        case fax, email
        case representativeName = "representative_name"
        case foundedAt = "founded_at"
        case workerNumber = "worker_number"
        case take
        case recruitmentID = "recruitment_id"
    }
}

public extension CompanyInfoDetailResponseDTO {
    func toDomain() -> CompanyInfoDetailEntity {
        CompanyInfoDetailEntity(
            businessNumber: businessNumber,
            companyName: companyName,
            companyProfileURL: companyProfileURL,
            companyIntroduce: companyIntroduce,
            zipCode1: zipCode1,
            address1: address1,
            zipCode2: zipCode2 ?? "없음",
            address2: address2 ?? "없음",
            manager1: manager1,
            phoneNumber1: phoneNumber1,
            manager2: manager2 ?? "없음",
            phoneNumber2: phoneNumber2 ?? "없음",
            fax: fax ?? "없음",
            email: email,
            representativeName: representativeName,
            foundedAt: foundedAt,
            workerNumber: String(workerNumber),
            take: String(take),
            recruitmentID: recruitmentID
        )
    }
}
