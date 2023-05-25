import Moya
import CompaniesDomainInterface
import BaseDomain

public enum CompaniesAPI {
    case fetchStudentCompanyList(page: Int, name: String?)
    case fetchCompanyInfoDetail(id: String)
}

extension CompaniesAPI: JobisAPI {
    public typealias ErrorType = CompaniesDomainError

    public var domain: JobisDomain {
        .companies
    }

    public var urlPath: String {
        switch self {
        case .fetchStudentCompanyList:
            return "/student"
        case let .fetchCompanyInfoDetail(id):
            return "/\(id)"
        }
    }

    public var method: Method {
        switch self {
        case .fetchStudentCompanyList, .fetchCompanyInfoDetail:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .fetchStudentCompanyList(page, name):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "name": name ?? ""
                ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchStudentCompanyList:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        case .fetchCompanyInfoDetail:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound
            ]
        }
    }
}
