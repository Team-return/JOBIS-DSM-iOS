import Foundation

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
            militarySupport: militarySupport,
            hiringJobs: hiringJobs,
            bookmarked: bookmarked
        )
    }
}
