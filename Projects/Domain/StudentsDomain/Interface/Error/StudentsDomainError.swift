import Foundation

public enum StudentsDomainError: Error {
    // Sign up
    case badRequest
    case unauthorized
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
        case .notFound:
            return "User Not Found"
        case .conflict:
            return "Conflict"
        }
    }
}
