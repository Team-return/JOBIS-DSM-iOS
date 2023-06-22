import Moya
import StudentsDomainInterface
import BaseDomain

public enum StudentsAPI {
    case signup(SignupRequestDto)
    case renewalPassword(RenewalPasswordRequestDTO)
    case studentExists(gcn: Int, name: String)
    case fetchStudentInfo
    case compareCurrentPasssword(password: String)
    case changePassword(ChangePasswordRequestDTO)
}

extension StudentsAPI: JobisAPI {
    public typealias ErrorType = StudentsDomainError

    public var domain: JobisDomain {
        .students
    }

    public var urlPath: String {
        switch self {
        case .signup:
            return ""

        case .renewalPassword:
            return "/forgotten_password"

        case .studentExists:
            return "/exists"

        case .fetchStudentInfo:
            return "/my"

        case .compareCurrentPasssword, .changePassword:
            return "/password"
        }
    }

    public var method: Method {
        switch self {
        case .signup:
            return .post

        case .renewalPassword, .changePassword:
            return .patch

        case .studentExists, .fetchStudentInfo, .compareCurrentPasssword:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .signup(req):
            return .requestJSONEncodable(req)

        case let .renewalPassword(req):
            return .requestJSONEncodable(req)

        case let .studentExists(gcn, name):
            return .requestParameters(
                parameters: [
                    "gcn": gcn,
                    "name": name
                ],
                encoding: URLEncoding.queryString)

        case .fetchStudentInfo:
            return .requestPlain

        case let .compareCurrentPasssword(password):
            return .requestParameters(
                parameters: [
                    "password": password
                ], encoding: URLEncoding.queryString)

        case let .changePassword(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchStudentInfo, .compareCurrentPasssword:
            return .accessToken
        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .signup:
            return [
                409: .alreadyExistsAccount
            ]

        case .renewalPassword:
            return [
                400: .badRequest,
                401: .unauthorized,
                404: .notFound,
                409: .conflict
            ]

        case .studentExists:
            return [
                404: .notExistsStudent
            ]

        case .fetchStudentInfo:
            return [:]

        case .compareCurrentPasssword:
            return [
                401: .wrongPassword
            ]

        case .changePassword:
            return [
                401: .wrongPassword
            ]
        }
    }
}
