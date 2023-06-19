import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
}

public extension ModulePaths {
    enum Feature: String {
        case BookmarkListFeature
        case RecruitmentFeature
        case FindCompanyFeature
        case MyPageFeature
        case HomeFeature
        case MenuFeature
        case BaseFeature
        case MainTabFeature
        case RootFeature
        case SplashFeature
        case SignupFeature
        case SigninFeature

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Domain: String {
        case FilesDomain
        case ReviewsDomain
        case BookmarksDomain
        case ApplicationsDomain
        case CodesDomain
        case StudentsDomain
        case CompaniesDomain
        case RecruitmentsDomain
        case UsersDomain
        case BaseDomain
        case AuthDomain

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Core: String {
        case DesignSystem
        case JwtStore

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Shared: String {
        case UtilityModule
        case GlobalThirdPartyLibrary

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
}
