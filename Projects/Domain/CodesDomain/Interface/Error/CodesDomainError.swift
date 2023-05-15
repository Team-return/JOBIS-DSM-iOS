import Foundation

public enum CodesDomainError: Error {
    case badRequest
}

extension CodesDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        }
    }
}
