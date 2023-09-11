import Foundation

public extension CompanyInfoDetailResponseDTO {
    func toDomain() -> CompanyInfoDetailEntity {
        return CompanyInfoDetailEntity(
            businessNumber: businessNumber,
            companyName: companyName,
            companyProfileURL: companyProfileURL,
            companyIntroduce: companyIntroduce,
            mainZipCode: mainZipCode,
            mainAddress: mainAddress,
            mainAddressDetail: mainAddressDetail,
            subZipCode: subZipCode ?? "없음",
            subAddress: subAddress ?? "없음",
            subAddressDetail: subAddressDetail ?? "없음",
            managerName: managerName,
            managerPhoneNo: managerPhoneNo,
            subManagerName: subManagerName ?? "없음",
            subManagerPhoneNo: subManagerPhoneNo ?? "없음",
            fax: fax ?? "없음",
            email: email,
            representativeName: representativeName,
            foundedAt: foundedAt,
            workerNumber: String(workerNumber) + "명",
            take: String(take) + "억원",
            recruitmentID: recruitmentID,
            serviceName: serviceName,
            businessArea: businessArea
        )
    }
}
