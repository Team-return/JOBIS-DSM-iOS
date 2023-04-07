import Moya
import UsersDomainInterface
import BaseDomain

public enum UsersAPI {
    case signin(SigninRequestDTO)
}

extension UsersAPI: JobisAPI {
    public typealias ErrorType = UsersDomainError

    public var domain: JobisDomain {
        .users
    }

    public var urlPath: String {
        switch self {
        case .signin:
            return "/login"
        }
    }

    public var method: Method {
        switch self {
        case .signin:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)
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
        case .signin:
            return [
                400: .notSpaceInput,
                401: .notFoundPassword,
                404: .notFound,
                500: .internalServerError
            ]
        }
    }
}
