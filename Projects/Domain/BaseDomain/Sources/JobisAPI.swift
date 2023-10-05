import Foundation
import Moya
import Environment

public protocol JobisAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: JobisDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension JobisAPI {
    var baseURL: URL {
        Environment.getUrlValue(key: .apiBaseUrl) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum JobisDomain: String {
    case auth
    case users
    case recruitments
    case companies
    case students
    case codes
    case applications
    case bookmarks
    case reviews
    case files
    case bugs
}

extension JobisDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
