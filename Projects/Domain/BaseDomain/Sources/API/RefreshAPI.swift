import Moya
import UserDomainInterface

public enum RefreshAPI {
    case reissueToken
}

extension RefreshAPI: JobisAPI {
    public typealias ErrorType = RefreshError

    public var domain: JobisDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .reissueToken:
            return "/reissue"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .reissueToken:
            return .put
        }
    }

    public var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .reissueToken:
            return [
                401: .unauthorized,
                404: .unauthorized
            ]
        }
    }
}
