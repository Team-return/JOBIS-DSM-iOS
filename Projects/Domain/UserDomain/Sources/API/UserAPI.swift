import Moya
import UserDomainInterface
import BaseDomain

public enum UsersAPI {
    case signin(SigninRequestDTO)
    case reissueToken
}

extension UsersAPI: JobisAPI {
    public typealias ErrorType = UserDomainError

    public var domain: JobisDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .signin:
            return "/login"

        case .reissueToken:
            return "reissue"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .signin:
            return .post

        case .reissueToken:
            return .put
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken

        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .signin:
            return [
                400: .badRequest,
                401: .unauthorized,
                500: .internalServerError
            ]

        case .reissueToken:
            return [
                400: .unauthorized,
                404: .notFound
            ]
        }
    }
}
