import Moya
import StudentsDomainInterface
import BaseDomain

public enum StudentsAPI {
    case signup
    case renewalPassword(RenewalPasswordRequestDTO)
}

extension StudentsAPI: JobisAPI {
    public typealias ErrorType = StudentsDomainError

    public var domain: JobisDomain {
        .students
    }

    public var urlPath: String {
        switch self {
        case .signup:
            return "/"
        case .renewalPassword:
            return "/password"
        }
    }

    public var method: Method {
        switch self {
        case .sendAuthCode:
            return .post
        case .signup:
            return .patch
        }
    }

    public var task: Task {
        switch self {
        case let .sendAuthCode(req):
            return .requestJSONEncodable(req)
        case .signup:
            return .requestPlain
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
        case .signup:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        case .sendAuthCode:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
