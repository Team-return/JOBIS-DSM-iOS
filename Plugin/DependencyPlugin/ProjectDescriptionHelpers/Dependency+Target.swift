import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
}

public extension TargetDependency.Feature {
    static let RecruitmentFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.RecruitmentFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.RecruitmentFeature.rawValue)
    )
    static let RecruitmentFeature = TargetDependency.project(
        target: ModulePaths.Feature.RecruitmentFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RecruitmentFeature.rawValue)
    )
    static let FindCompanyFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.FindCompanyFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.FindCompanyFeature.rawValue)
    )
    static let FindCompanyFeature = TargetDependency.project(
        target: ModulePaths.Feature.FindCompanyFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.FindCompanyFeature.rawValue)
    )
    static let MyPageFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.MyPageFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.MyPageFeature.rawValue)
    )
    static let MyPageFeature = TargetDependency.project(
        target: ModulePaths.Feature.MyPageFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.MyPageFeature.rawValue)
    )
    static let HomeFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.HomeFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.HomeFeature.rawValue)
    )
    static let HomeFeature = TargetDependency.project(
        target: ModulePaths.Feature.HomeFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.HomeFeature.rawValue)
    )
    static let MenuFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.MenuFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.MenuFeature.rawValue)
    )
    static let MenuFeature = TargetDependency.project(
        target: ModulePaths.Feature.MenuFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.MenuFeature.rawValue)
    )
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
    static let MainTabFeature = TargetDependency.project(
        target: ModulePaths.Feature.MainTabFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.MainTabFeature.rawValue)
    )
    static let MainTabFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.MainTabFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.MainTabFeature.rawValue)
    )
    static let SplashFeature = TargetDependency.project(
        target: ModulePaths.Feature.SplashFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SplashFeature.rawValue)
    )
    static let SplashFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SplashFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SplashFeature.rawValue)
    )
    static let RootFeature = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let RootFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let SignupFeature = TargetDependency.project(
        target: ModulePaths.Feature.SignupFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SignupFeature.rawValue)
    )
    static let SignupFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SignupFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SignupFeature.rawValue)
    )
    static let SigninFeature = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
    static let SigninFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
    static let BookmarksDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.BookmarksDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.BookmarksDomain.rawValue)
    )
    static let BookmarksDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.BookmarksDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.BookmarksDomain.rawValue)
    )
    static let BookmarksDomain = TargetDependency.project(
        target: ModulePaths.Domain.BookmarksDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BookmarksDomain.rawValue)
    )
    static let ApplicationsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.ApplicationsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.ApplicationsDomain.rawValue)
    )
    static let ApplicationsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.ApplicationsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.ApplicationsDomain.rawValue)
    )
    static let ApplicationsDomain = TargetDependency.project(
        target: ModulePaths.Domain.ApplicationsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.ApplicationsDomain.rawValue)
    )
    static let CodesDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.CodesDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.CodesDomain.rawValue)
    )
    static let CodesDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.CodesDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.CodesDomain.rawValue)
    )
    static let CodesDomain = TargetDependency.project(
        target: ModulePaths.Domain.CodesDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.CodesDomain.rawValue)
    )
    static let StudentsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let StudentsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let StudentsDomain = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let CompaniesDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.CompaniesDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.CompaniesDomain.rawValue)
    )
    static let CompaniesDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.CompaniesDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.CompaniesDomain.rawValue)
    )
    static let CompaniesDomain = TargetDependency.project(
        target: ModulePaths.Domain.CompaniesDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.CompaniesDomain.rawValue)
    )
    static let RecruitmentsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.RecruitmentsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.RecruitmentsDomain.rawValue)
    )
    static let RecruitmentsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.RecruitmentsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.RecruitmentsDomain.rawValue)
    )
    static let RecruitmentsDomain = TargetDependency.project(
        target: ModulePaths.Domain.RecruitmentsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.RecruitmentsDomain.rawValue)
    )
    static let UsersDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let UsersDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let UsersDomain = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let BaseDomain = TargetDependency.project(
        target: ModulePaths.Domain.BaseDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BaseDomain.rawValue)
    )
    static let AuthDomain = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
}

public extension TargetDependency.Core {
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Core.DesignSystem.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.DesignSystem.rawValue)
    )
    static let JwtStoreTesting = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .testing),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
    static let JwtStoreInterface = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .interface),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
    static let JwtStore = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
}

public extension TargetDependency.Shared {
    static let UtilityModule = TargetDependency.project(
        target: ModulePaths.Shared.UtilityModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.UtilityModule.rawValue)
    )
    static let GlobalThirdPartyLibrary = TargetDependency.project(
        target: ModulePaths.Shared.GlobalThirdPartyLibrary.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue)
    )
}
