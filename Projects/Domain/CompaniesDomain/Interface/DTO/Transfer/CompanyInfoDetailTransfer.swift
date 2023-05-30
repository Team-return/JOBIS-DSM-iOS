import Foundation

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
