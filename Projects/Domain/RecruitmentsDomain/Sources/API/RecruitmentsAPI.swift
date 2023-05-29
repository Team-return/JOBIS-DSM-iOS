import Moya
import RecruitmentsDomainInterface
import BaseDomain

public enum RecruitmentsAPI {
    case fetchRecruitmentDetail(id: String)
    case fetchRecruitmentList(page: Int, codeId: Int?, company: String?)
}

extension RecruitmentsAPI: JobisAPI {
    public typealias ErrorType = RecruitmentsDomainError

    public var domain: JobisDomain {
        .recruitments
    }

    public var urlPath: String {
        switch self {
        case let .fetchRecruitmentDetail(id):
            return "/\(id)"
        case .fetchRecruitmentList:
            return "/student"
        }
    }

    public var method: Method {
        switch self {
        case .fetchRecruitmentList, .fetchRecruitmentDetail:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .fetchRecruitmentList(page, keyword, company):
            return .requestParameters(parameters: [
                "page": page,
                "keyword": keyword ?? "",
                "company": company ?? ""
            ],
            encoding: URLEncoding.queryString)
        case .fetchRecruitmentDetail:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchRecruitmentDetail:
            return [
                401: .unauthorized,
                403: .forbidden,
                404: .notFound
            ]
        case .fetchRecruitmentList:
            return [
                401: .unauthorized,
                403: .forbidden
            ]
        }
    }
}
