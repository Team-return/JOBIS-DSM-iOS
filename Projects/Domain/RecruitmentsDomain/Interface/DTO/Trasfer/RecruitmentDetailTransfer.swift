import Foundation

public extension RecruitmentDetailResponseDTO {
    func toDomain() -> RecruitmentDetailEntity {
        var unwrappedRequiredGrade: String? {
            if let requiredGrade {
                return String(requiredGrade) + "% 이내"
            } else {
                return nil
            }
        }
        var unwrappedPay: String? {
            if let pay {
                return String(pay) + " 만원/년"
            } else {
                return nil
            }
        }
        return RecruitmentDetailEntity(
            companyID: companyID,
            companyProfileUrl: companyProfileUrl,
            companyName: companyName,
            areas: areas.map { $0.toDomain() },
            preferentialTreatment: preferentialTreatment,
            requiredGrade: unwrappedRequiredGrade,
            workHours: String(workHours),
            requiredLicenses: requiredLicenses?.joined(separator: ", "),
            hiringProgress: hiringProgress.enumerated().map { (index, value) in
                "\(index + 1). \(value.localizedString())"
            }.joined(separator: "\n"),
            trainPay: String(trainPay),
            pay: unwrappedPay,
            benefits: benefits,
            military: military,
            submitDocument: submitDocument,
            startDate: startDate,
            endDate: endDate,
            etc: etc ?? "없음"
        )
    }
}

public extension AreaResponseDTO {
    func toDomain() -> AreaEntity {
        AreaEntity(
            id: String(id),
            job: job,
            tech: tech,
            hiring: hiring,
            majorTask: majorTask
        )
    }
}
