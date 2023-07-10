import Foundation

public enum ApplicationsDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict

    case noThirdGrade
    case notFoundRecruitment
    case alreadyApply

    case isSpace
}

extension ApplicationsDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"

        case .unauthorized:
            return "Unauthorized"

        case .forbidden:
            return "Forbidden"

        case .notFound:
            return "User Not Found"

        case .conflict:
            return "Conflict"

        case .noThirdGrade:
            return "3학년이 아니면 지원할 수 없습니다."

        case .notFoundRecruitment:
            return "모집의뢰서를 찾을 수 없습니다."

        case .alreadyApply:
            return "승인된 지원서가 존재하거나, 이미 지원한 기업입니다."

        case .isSpace:
            return "공백이 있습니다."
        }
    }
}
