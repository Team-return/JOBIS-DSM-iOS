import Foundation

public enum ApplicationsDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict

    case noThirdGrad
    case notFoundRecruitment
    case alreadyApply
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

        case .noThirdGrad:
            return "3학년이 아니면 지원할 수 없습니다."

        case .notFoundRecruitment:
            return "모집의뢰서를 찾을 수 없습니다."

        case .alreadyApply:
            return "이미 지원한 모집의뢰서입니다."
        }
    }
}
