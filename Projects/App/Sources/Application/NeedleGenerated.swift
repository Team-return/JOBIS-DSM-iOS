

import ApplicationsDomain
import ApplicationsDomainInterface
import AuthDomain
import AuthDomainInterface
import BookmarksDomain
import BookmarksDomainInterface
import CodesDomain
import CodesDomainInterface
import CompaniesDomain
import CompaniesDomainInterface
import HomeFeature
import HomeFeatureInterface
import JwtStoreInterface
import MainTabFeature
import MenuFeature
import MenuFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import RecruitmentsDomain
import RecruitmentsDomainInterface
import RootFeature
import RootFeatureInterface
import SigninFeature
import SigninFeatureInterface
import SignupFeature
import SignupFeatureInterface
import SplashFeature
import SplashFeatureInterface
import StudentsDomain
import StudentsDomainInterface
import SwiftUI
import UsersDomain
import UsersDomainInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var reissueTokenUseCase: any ReissueTokenUseCase {
        return appComponent.reissueTokenUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
private class SignupDependency1ff7d1355204bb65e850Provider: SignupDependency {
    var signupUseCase: any SignupUseCase {
        return appComponent.signupUseCase
    }
    var studentExistsUseCase: any StudentExistsUseCase {
        return appComponent.studentExistsUseCase
    }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupComponent
private func factory86602ff0d0dbaf2cb017f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupDependency1ff7d1355204bb65e850Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {
    var homeComponent: HomeComponent {
        return appComponent.homeComponent
    }
    var myPageComponent: MyPageComponent {
        return appComponent.myPageComponent
    }
    var menuComponent: MenuComponent {
        return appComponent.menuComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {


    init() {

    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider()
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinComponent: SigninComponent {
        return appComponent.signinComponent
    }
    var mainTabComponent: MainTabComponent {
        return appComponent.mainTabComponent
    }
    var splashComponent: SplashComponent {
        return appComponent.splashComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var signinUseCase: any SigninUseCase {
        return appComponent.signinUseCase
    }
    var signupComponent: SignupComponent {
        return appComponent.signupComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debccf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var fetchApplicationUseCase: any FetchApplicationUseCase {
        return appComponent.fetchApplicationUseCase
    }
    var fetchTotalPassStudentUseCase: any FetchTotalPassStudentUseCase {
        return appComponent.fetchTotalPassStudentUseCase
    }
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase {
        return appComponent.fetchStudentInfoUseCase
    }
    var recruitmentComponent: RecruitmentComponent {
        return appComponent.recruitmentComponent
    }
    var findWorkSpaceComponent: FindWorkSpaceComponent {
        return appComponent.findWorkSpaceComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class RecruitmentDependency799de5378039058f4ec0Provider: RecruitmentDependency {
    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase {
        return appComponent.fetchRecruitmentListUseCase
    }
    var bookmarkUseCase: any BookmarkUseCase {
        return appComponent.bookmarkUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RecruitmentComponent
private func factoryb1923ea1b010875d9389f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecruitmentDependency799de5378039058f4ec0Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindWorkSpaceDependencya6881a191be8b67a7f28Provider: FindWorkSpaceDependency {
    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase {
        return appComponent.fetchStudentCompanyListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindWorkSpaceComponent
private func factory356b7b8d0b5d948a9152f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindWorkSpaceDependencya6881a191be8b67a7f28Provider(appComponent: parent1(component) as! AppComponent)
}
private class MenuDependency43a0e3ba5712a2a90856Provider: MenuDependency {


    init() {

    }
}
/// ^->AppComponent->MenuComponent
private func factory9727a582143c5cd40ff3e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MenuDependency43a0e3ba5712a2a90856Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-any Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { [unowned self] in self.sendAuthCodeUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { [unowned self] in self.verifyAuthCodeUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["remoteRecruitmentsDataSource-any RemoteRecruitmentsDataSource"] = { [unowned self] in self.remoteRecruitmentsDataSource as Any }
        localTable["recruitmentsRepository-any RecruitmentsRepository"] = { [unowned self] in self.recruitmentsRepository as Any }
        localTable["fetchRecruitmentDetailUseCase-any FetchRecruitmentDetailUseCase"] = { [unowned self] in self.fetchRecruitmentDetailUseCase as Any }
        localTable["fetchRecruitmentListUseCase-any FetchRecruitmentListUseCase"] = { [unowned self] in self.fetchRecruitmentListUseCase as Any }
        localTable["remoteCodesDataSource-any RemoteCodesDataSource"] = { [unowned self] in self.remoteCodesDataSource as Any }
        localTable["codesRepository-any CodesRepository"] = { [unowned self] in self.codesRepository as Any }
        localTable["fetchCodesUseCase-any FetchCodesUseCase"] = { [unowned self] in self.fetchCodesUseCase as Any }
        localTable["signinComponent-SigninComponent"] = { [unowned self] in self.signinComponent as Any }
        localTable["signupComponent-SignupComponent"] = { [unowned self] in self.signupComponent as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { [unowned self] in self.mainTabComponent as Any }
        localTable["recruitmentComponent-RecruitmentComponent"] = { [unowned self] in self.recruitmentComponent as Any }
        localTable["findWorkSpaceComponent-FindWorkSpaceComponent"] = { [unowned self] in self.findWorkSpaceComponent as Any }
        localTable["homeComponent-HomeComponent"] = { [unowned self] in self.homeComponent as Any }
        localTable["myPageComponent-MyPageComponent"] = { [unowned self] in self.myPageComponent as Any }
        localTable["menuComponent-MenuComponent"] = { [unowned self] in self.menuComponent as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { [unowned self] in self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { [unowned self] in self.studentsRepository as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { [unowned self] in self.renewalPasswordUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { [unowned self] in self.signupUseCase as Any }
        localTable["studentExistsUseCase-any StudentExistsUseCase"] = { [unowned self] in self.studentExistsUseCase as Any }
        localTable["fetchStudentInfoUseCase-any FetchStudentInfoUseCase"] = { [unowned self] in self.fetchStudentInfoUseCase as Any }
        localTable["remoteBookmarksDataSource-any RemoteBookmarksDataSource"] = { [unowned self] in self.remoteBookmarksDataSource as Any }
        localTable["bookmarksRepository-any BookmarksRepository"] = { [unowned self] in self.bookmarksRepository as Any }
        localTable["fetchBookmarkListUseCase-any FetchBookmarkListUseCase"] = { [unowned self] in self.fetchBookmarkListUseCase as Any }
        localTable["bookmarkUseCase-any BookmarkUseCase"] = { [unowned self] in self.bookmarkUseCase as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { [unowned self] in self.remoteUsersDataSource as Any }
        localTable["usersRepository-any UsersRepository"] = { [unowned self] in self.usersRepository as Any }
        localTable["signinUseCase-any SigninUseCase"] = { [unowned self] in self.signinUseCase as Any }
        localTable["remoteApplicationsDataSource-any RemoteApplicationsDataSource"] = { [unowned self] in self.remoteApplicationsDataSource as Any }
        localTable["applicationsRepository-any ApplicationsRepository"] = { [unowned self] in self.applicationsRepository as Any }
        localTable["applyCompanyUseCase-any ApplyCompanyUseCase"] = { [unowned self] in self.applyCompanyUseCase as Any }
        localTable["cancelApplyUseCase-any CancelApplyUseCase"] = { [unowned self] in self.cancelApplyUseCase as Any }
        localTable["fetchApplicationUseCase-any FetchApplicationUseCase"] = { [unowned self] in self.fetchApplicationUseCase as Any }
        localTable["fetchTotalPassStudentUseCase-any FetchTotalPassStudentUseCase"] = { [unowned self] in self.fetchTotalPassStudentUseCase as Any }
        localTable["remoteCompaniesDataSource-any RemoteCompaniesDataSource"] = { [unowned self] in self.remoteCompaniesDataSource as Any }
        localTable["companiesRepository-any CompaniesRepository"] = { [unowned self] in self.companiesRepository as Any }
        localTable["fetchCompanyInfoDetailUseCase-any FetchCompanyInfoDetailUseCase"] = { [unowned self] in self.fetchCompanyInfoDetailUseCase as Any }
        localTable["fetchStudentCompanyListUseCase-any FetchStudentCompanyListUseCase"] = { [unowned self] in self.fetchStudentCompanyListUseCase as Any }
    }
}
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.reissueTokenUseCase] = "reissueTokenUseCase-any ReissueTokenUseCase"
    }
}
extension SignupComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupDependency.signupUseCase] = "signupUseCase-any SignupUseCase"
        keyPathToName[\SignupDependency.studentExistsUseCase] = "studentExistsUseCase-any StudentExistsUseCase"
        keyPathToName[\SignupDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\SignupDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
    }
}
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.homeComponent] = "homeComponent-HomeComponent"
        keyPathToName[\MainTabDependency.myPageComponent] = "myPageComponent-MyPageComponent"
        keyPathToName[\MainTabDependency.menuComponent] = "menuComponent-MenuComponent"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {

    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinComponent] = "signinComponent-SigninComponent"
        keyPathToName[\RootDependency.mainTabComponent] = "mainTabComponent-MainTabComponent"
        keyPathToName[\RootDependency.splashComponent] = "splashComponent-SplashComponent"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
        keyPathToName[\SigninDependency.signupComponent] = "signupComponent-SignupComponent"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchApplicationUseCase] = "fetchApplicationUseCase-any FetchApplicationUseCase"
        keyPathToName[\HomeDependency.fetchTotalPassStudentUseCase] = "fetchTotalPassStudentUseCase-any FetchTotalPassStudentUseCase"
        keyPathToName[\HomeDependency.fetchStudentInfoUseCase] = "fetchStudentInfoUseCase-any FetchStudentInfoUseCase"
        keyPathToName[\HomeDependency.recruitmentComponent] = "recruitmentComponent-RecruitmentComponent"
        keyPathToName[\HomeDependency.findWorkSpaceComponent] = "findWorkSpaceComponent-FindWorkSpaceComponent"
    }
}
extension RecruitmentComponent: Registration {
    public func registerItems() {
        keyPathToName[\RecruitmentDependency.fetchRecruitmentListUseCase] = "fetchRecruitmentListUseCase-any FetchRecruitmentListUseCase"
        keyPathToName[\RecruitmentDependency.bookmarkUseCase] = "bookmarkUseCase-any BookmarkUseCase"
    }
}
extension FindWorkSpaceComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindWorkSpaceDependency.fetchStudentCompanyListUseCase] = "fetchStudentCompanyListUseCase-any FetchStudentCompanyListUseCase"
    }
}
extension MenuComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupComponent", factory86602ff0d0dbaf2cb017f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RecruitmentComponent", factoryb1923ea1b010875d9389f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindWorkSpaceComponent", factory356b7b8d0b5d948a9152f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MenuComponent", factory9727a582143c5cd40ff3e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
