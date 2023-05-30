import Foundation

public extension RecruitmentDetailResponseDTO {
    func toDomain() -> RecruitmentDetailEntity {
        RecruitmentDetailEntity(
            companyID: companyID,
            areas: areas.map { $0.toDomain() },
            preferentialTreatment: preferentialTreatment ?? "없음",
            requiredGrade: requiredGrade,
            workHours: String(workHours),
            requiredLicenses: requiredLicenses?.joined(separator: ", ") ?? "없음",
            hiringProgress: hiringProgress.enumerated().map { (index, value) in
                "\(index + 1). \(value.localizedString())"
            }.joined(separator: "\n"),
            trainPay: String(trainPay),
            pay: pay,
            benefits: benefits ?? "없음",
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
