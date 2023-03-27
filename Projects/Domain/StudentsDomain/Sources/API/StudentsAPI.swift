import Moya
import StudentsDomainInterface
import BaseDomain

public enum StudentsAPI {
    case signup(SignupRequestDto)
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
        case .signup:
            return .post
        case .renewalPassword:
            return .patch
        }
    }

    public var task: Task {
        switch self {
        case let .signup(req):
            return .requestJSONEncodable(req)
        case let .renewalPassword(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        .none
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .signup:
            return [
                400: .badRequest,
                409: .conflict
            ]
        case .renewalPassword:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
