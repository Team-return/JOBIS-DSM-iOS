import Foundation

public extension BugDetailResponseDTO {
    func toDomain() -> BugDetailEntity {
        BugDetailEntity(
            title: title,
            content: content,
            developmentArea: developmentArea,
            attachments: attachments,
            createdAt: createdAt
        )
    }
}
