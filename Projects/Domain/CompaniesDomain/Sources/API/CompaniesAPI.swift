import Moya
import CompaniesDomainInterface
import BaseDomain

public enum CompaniesAPI {
    case fetchStudentCompanyList
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
        .requestPlain
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
