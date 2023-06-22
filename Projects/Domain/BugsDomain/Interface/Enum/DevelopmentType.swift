import Foundation

public enum DevelopmentType: String, Encodable {
    case all = "ALL"
    case server = "SERVER"
    case web = "WEB"
    case ios = "IOS"

    public func localizedString() -> String {
        switch self {
        case .all:
            return "전체"

        case .server:
            return "서버"

        case .web:
            return "웹"

        case .ios:
            return "iOS"
        }
    }
}
