import Foundation

public extension TotalPassStudentResponseDTO {
    func toDomain() -> TotalPassStudentEntity {
        TotalPassStudentEntity(
            totalStudentCount: totalStudentCount,
            passedCount: passedCount,
            approvedCount: approvedCount
        )
    }
}
