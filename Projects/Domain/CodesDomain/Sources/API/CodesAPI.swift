import Moya
import CodesDomainInterface
import BaseDomain

public enum CodesAPI {
    case fetchCodes(keyword: String?, type: CodeType, parentCode: String?)
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
        case let .fetchCodes(keyword, type, parentCode):
            return .requestParameters(
                parameters: [
                    "keyword": keyword ?? "",
                    "type": type.rawValue,
                    "parent_code": parentCode ?? ""
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
