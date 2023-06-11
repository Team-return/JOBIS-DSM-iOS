import Moya
import Foundation
import RecruitmentsDomainInterface
import BaseDomain

public enum RecruitmentsAPI {
    case fetchRecruitmentDetail(id: String)
    case fetchRecruitmentList(page: Int, code: String?, name: String?)
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
        case let .fetchRecruitmentList(page, code, name):
            let pageQuery = "page=\(page)"
            let codeQuery = "code=\(code ?? "")"
            let nameQuery = "name=\(name ?? "")"
            let queryString = "/student?" + [pageQuery, codeQuery, nameQuery].joined(separator: "&")
            if let encodedString = queryString.addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed) {
                return encodedString
            }
            return "/student"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchRecruitmentList, .fetchRecruitmentDetail:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchRecruitmentList:
            return .requestParameters(parameters: [:], encoding: URLEncoding.queryString)
        default:
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
