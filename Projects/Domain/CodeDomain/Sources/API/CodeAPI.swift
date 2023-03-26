import Moya
import CodeDomainInterface
import BaseDomain

public enum CodeAPI {
    case fetchJobCode
    case fetchTechCode(keyword: String)
}

extension CodeAPI: JobisAPI {
    public typealias ErrorType = CodeDomainError

    public var domain: JobisDomain {
        .code
    }

    public var urlPath: String {
        switch self {
        case .fetchJobCode:
            return "/job"
        case .fetchTechCode:
            return "/tech"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchJobCode, .fetchTechCode:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchJobCode:
            return .requestPlain
        case let .fetchTechCode(keyword):
            return .requestParameters(parameters: [
                "keyword": keyword
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
        case .fetchJobCode:
            return [:]
        case .fetchTechCode:
            return [
                400: .badRequest
            ]
        }
    }
}
