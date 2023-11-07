import Foundation
import Moya

public enum VersionAPI {
    case fetchMarketingVersion
}

extension VersionAPI: TargetType {
    public var baseURL: URL {
        URL(string: "http://itunes.apple.com/lookup")!
    }

    public var path: String {
        ""
    }

    public var method: Moya.Method {
        .get
    }

    public var task: Moya.Task {
        .requestParameters(parameters: [
            "id": "6450888392",
            "country": "kr"
        ], encoding: URLEncoding.queryString)
    }

    public var headers: [String: String]? {
        nil
    }
}
