import Moya
import Foundation
import RecruitmentsDomainInterface
import BaseDomain

public enum RecruitmentsAPI {
    case fetchRecruitmentDetail(id: String)
    case fetchRecruitmentList(
        page: Int,
        jobCode: String?,
        techCode: [String]?,
        name: String?,
        winterIntern: Bool
    )
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

    public var method: Moya.Method {
        switch self {
        case .fetchRecruitmentList, .fetchRecruitmentDetail:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchRecruitmentList(page, jobCode, techCode, name, winterIntern):
            var dic: [String: Any] = ["page": page]
            if let jobCode, !jobCode.isEmpty {
                dic.updateValue(jobCode, forKey: "job_code")
            }
            if let techCode, !techCode.isEmpty {
                dic.updateValue(techCode.joined(separator: ","), forKey: "tech_code")
            }
            if let name, !name.isEmpty {
                dic.updateValue(name, forKey: "name")
            }
            dic.updateValue(winterIntern, forKey: "winter_intern")

            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)

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
