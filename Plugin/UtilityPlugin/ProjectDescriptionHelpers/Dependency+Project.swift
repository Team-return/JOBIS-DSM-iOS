// swiftlint:disable nesting
import ProjectDescription

public extension TargetDependency {
    struct Project {
        public struct Features { }
        public struct Module { }
        public struct Service { }
        public struct UserInterfaces { }
    }
}

public extension TargetDependency.Project.Features {
//    static let SplashFeature = TargetDependency.feature(name: "SplashFeature")
//    static let MyPageFeature = TargetDependency.feature(name: "MyPageFeature")
//    static let NoticeFeature = TargetDependency.feature(name: "NoticeFeature")
//    static let ApplyFeature = TargetDependency.feature(name: "ApplyFeature")
//    static let SignupFeature = TargetDependency.feature(name: "SignupFeature")
//    static let HomeFeature = TargetDependency.feature(name: "HomeFeature")
//    static let RenewalPasswordFeature = TargetDependency.feature(name: "RenewalPasswordFeature")
//    static let MainTabFeature = TargetDependency.feature(name: "MainTabFeature")
//    static let FindIDFeature = TargetDependency.feature(name: "FindIDFeature")
//    static let SigninFeature = TargetDependency.feature(name: "SigninFeature")
    static let BaseFeature = TargetDependency.feature(name: "BaseFeature")
//    static let RootFeature = TargetDependency.feature(name: "RootFeature")
}

public extension TargetDependency.Project.Module {
//    static let KeychainModule = TargetDependency.module(name: "KeychainModule")
//    static let ErrorModule = TargetDependency.module(name: "ErrorModule")
//    static let FeatureThirdPartyLib = TargetDependency.module(name: "FeatureThirdPartyLib")
    static let ThirdPartyLib = TargetDependency.module(name: "ThirdPartyLib")
//    static let Utility = TargetDependency.module(name: "Utility")
}

public extension TargetDependency.Project.Service {
    static let Service = TargetDependency.service(name: "Service")
//    static let DataMappingModule = TargetDependency.service(name: "DataMappingModule")
//    static let APIKit = TargetDependency.service(name: "APIKit")
//    static let Data = TargetDependency.service(name: "DataModule")
//    static let Domain = TargetDependency.service(name: "DomainModule")
//    static let DatabaseModule = TargetDependency.service(name: "DatabaseModule")
//    static let NetworkModule = TargetDependency.service(name: "NetworkModule")
}

public extension TargetDependency.Project.UserInterfaces {
    static let DesignSystem = TargetDependency.ui(name: "DesignSystem")
}
