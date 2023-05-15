import Moya
import CodesDomainInterface
import BaseDomain

public enum CodesAPI {
    case fetchCodes(keyword: String, type: CodeType)
}

extension CodesAPI: JobisAPI {
    public typealias ErrorType = CodesDomainError

    public var domain: JobisDomain {
        .codes
    }

    public var urlPath: String {
        switch self {
        case .fetchCodes:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .fetchCodes:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .fetchCodes(keyword, type):
            return .requestParameters(
                parameters: [
                    "keyword": keyword,
                    "type": type
                ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchCodes:
            return [:]
        }
    }
}
