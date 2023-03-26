import Foundation

public struct TechCodeRequestDTO: Decodable {
    public let code: Int
    public let keyword: String

    public init(code: Int, keyword: String) {
        self.code = code
        self.keyword = keyword
    }
}

public extension [TechCodeRequestDTO] {
    func toDomain() -> [TechCodeEntity] {
        map { $0.toDomain() }
    }
}

public extension TechCodeRequestDTO {
    func toDomain() -> TechCodeEntity {
        TechCodeEntity(
            code: code,
            keyword: keyword
        )
    }
}
