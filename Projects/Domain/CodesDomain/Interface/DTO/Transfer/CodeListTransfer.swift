import Foundation

public extension CodeListResponseDTO {
    func toDomain() -> CodeListEntity {
        CodeListEntity(codes: codes.map { $0.toDomain() })
    }
}

public extension CodeResponseDTO {
    func toDomain() -> CodeEntity {
        CodeEntity(
            code: code,
            keyword: keyword
        )
    }
}
