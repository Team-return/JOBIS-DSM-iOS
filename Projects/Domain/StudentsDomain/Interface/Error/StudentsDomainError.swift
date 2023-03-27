import Foundation

public enum StudentsDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
}

extension StudentsDomainError: LocalizedError {
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
        }
    }
}
