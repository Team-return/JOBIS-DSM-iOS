import Foundation

public extension StudentInfoResponseDTO {
    func toDomain() -> StudentInfoEntity {
        StudentInfoEntity(
            studentName: studentName,
            studentGcn: studentGcn,
            department: department
        )
    }
}
