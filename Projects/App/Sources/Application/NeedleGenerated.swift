

import ApplicationsDomain
import ApplicationsDomainInterface
import AuthDomain
import AuthDomainInterface
import BookmarkListFeature
import BookmarkListFeatureInterface
import BookmarksDomain
import BookmarksDomainInterface
import CodesDomain
import CodesDomainInterface
import CompaniesDomain
import CompaniesDomainInterface
import FindCompanyFeature
import FindCompanyFeatureInterface
import HomeFeature
import HomeFeatureInterface
import JwtStoreInterface
import MainTabFeature
import MainTabFeatureInterface
import MenuFeature
import MenuFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import RecruitmentFeature
import RecruitmentFeatureInterface
import RecruitmentsDomain
import RecruitmentsDomainInterface
import ReviewsDomain
import ReviewsDomainInterface
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
    var homeFactory: any HomeFactory {
        return appComponent.homeFactory
    }
    var bookmarkListFactory: any BookmarkListFactory {
        return appComponent.bookmarkListFactory
    }
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    var menuFactory: any MenuFactory {
        return appComponent.menuFactory
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
private class BookmarkListDependency51ed5641ae9b8f23fd81Provider: BookmarkListDependency {
    var fetchBookmarkListUseCase: any FetchBookmarkListUseCase {
        return appComponent.fetchBookmarkListUseCase
    }
    var bookmarkUseCase: any BookmarkUseCase {
        return appComponent.bookmarkUseCase
    }
    var recruitmentFactory: any RecruitmentFactory {
        return appComponent.recruitmentFactory
    }
    var recruitmentDetailFactory: any RecruitmentDetailFactory {
        return appComponent.recruitmentDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->BookmarkListComponent
private func factory4fe746186ebb99322754f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return BookmarkListDependency51ed5641ae9b8f23fd81Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinFactory: any SigninFactory {
        return appComponent.signinFactory
    }
    var mainTabFactory: any MainTabFactory {
        return appComponent.mainTabFactory
    }
    var splashFactory: any SplashFactory {
        return appComponent.splashFactory
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
    var signupFactory: any SignupFactory {
        return appComponent.signupFactory
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
    var recruitmentFactory: any RecruitmentFactory {
        return appComponent.recruitmentFactory
    }
    var findCompanyFactory: any FindCompanyFactory {
        return appComponent.findCompanyFactory
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
private class FindCompanyDependency40f7eec2789a2c3ddf11Provider: FindCompanyDependency {
    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase {
        return appComponent.fetchStudentCompanyListUseCase
    }
    var findCompanyDetailFactory: any FindCompanyDetailFactory {
        return appComponent.findCompanyDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindCompanyComponent
private func factory161fb699dfcd446598cbf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindCompanyDependency40f7eec2789a2c3ddf11Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindCompanyDetailDependency4141f6f851410a3f60d3Provider: FindCompanyDetailDependency {
    var fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase {
        return appComponent.fetchCompanyInfoDetailUseCase
    }
    var fetchReviewListUseCase: any FetchReviewListUseCase {
        return appComponent.fetchReviewListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindCompanyDetailComponent
private func factoryca6789757d5d9bbb6659f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindCompanyDetailDependency4141f6f851410a3f60d3Provider(appComponent: parent1(component) as! AppComponent)
}
private class RecruitmentDependency799de5378039058f4ec0Provider: RecruitmentDependency {
    var fetchRecruitmentListUseCase: any FetchRecruitmentListUseCase {
        return appComponent.fetchRecruitmentListUseCase
    }
    var bookmarkUseCase: any BookmarkUseCase {
        return appComponent.bookmarkUseCase
    }
    var fetchCodesUseCase: any FetchCodesUseCase {
        return appComponent.fetchCodesUseCase
    }
    var recruitmentDetailFactory: any RecruitmentDetailFactory {
        return appComponent.recruitmentDetailFactory
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
private class RecruitmentDetailDependency56f94833461a60671180Provider: RecruitmentDetailDependency {
    var fetchRecruitmentDetailUseCase: any FetchRecruitmentDetailUseCase {
        return appComponent.fetchRecruitmentDetailUseCase
    }
    var findCompanyDetailFactory: any FindCompanyDetailFactory {
        return appComponent.findCompanyDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RecruitmentDetailComponent
private func factory14d63d6fecffe94dd0e1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RecruitmentDetailDependency56f94833461a60671180Provider(appComponent: parent1(component) as! AppComponent)
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
        localTable["signinFactory-any SigninFactory"] = { [unowned self] in self.signinFactory as Any }
        localTable["signupFactory-any SignupFactory"] = { [unowned self] in self.signupFactory as Any }
        localTable["splashFactory-any SplashFactory"] = { [unowned self] in self.splashFactory as Any }
        localTable["mainTabFactory-any MainTabFactory"] = { [unowned self] in self.mainTabFactory as Any }
        localTable["recruitmentFactory-any RecruitmentFactory"] = { [unowned self] in self.recruitmentFactory as Any }
        localTable["recruitmentDetailFactory-any RecruitmentDetailFactory"] = { [unowned self] in self.recruitmentDetailFactory as Any }
        localTable["findCompanyFactory-any FindCompanyFactory"] = { [unowned self] in self.findCompanyFactory as Any }
        localTable["findCompanyDetailFactory-any FindCompanyDetailFactory"] = { [unowned self] in self.findCompanyDetailFactory as Any }
        localTable["bookmarkListFactory-any BookmarkListFactory"] = { [unowned self] in self.bookmarkListFactory as Any }
        localTable["homeFactory-any HomeFactory"] = { [unowned self] in self.homeFactory as Any }
        localTable["myPageFactory-any MyPageFactory"] = { [unowned self] in self.myPageFactory as Any }
        localTable["menuFactory-any MenuFactory"] = { [unowned self] in self.menuFactory as Any }
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
        localTable["remoteCodesDataSource-any RemoteCodesDataSource"] = { [unowned self] in self.remoteCodesDataSource as Any }
        localTable["codesRepository-any CodesRepository"] = { [unowned self] in self.codesRepository as Any }
        localTable["fetchCodesUseCase-any FetchCodesUseCase"] = { [unowned self] in self.fetchCodesUseCase as Any }
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
        localTable["remoteReviewsDataSource-any RemoteReviewsDataSource"] = { [unowned self] in self.remoteReviewsDataSource as Any }
        localTable["reviewsRepository-any ReviewsRepository"] = { [unowned self] in self.reviewsRepository as Any }
        localTable["fetchReviewDetailUseCase-any FetchReviewDetailUseCase"] = { [unowned self] in self.fetchReviewDetailUseCase as Any }
        localTable["fetchReviewListUseCase-any FetchReviewListUseCase"] = { [unowned self] in self.fetchReviewListUseCase as Any }
        localTable["postReviewUseCase-any PostReviewUseCase"] = { [unowned self] in self.postReviewUseCase as Any }
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
        keyPathToName[\MainTabDependency.homeFactory] = "homeFactory-any HomeFactory"
        keyPathToName[\MainTabDependency.bookmarkListFactory] = "bookmarkListFactory-any BookmarkListFactory"
        keyPathToName[\MainTabDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
        keyPathToName[\MainTabDependency.menuFactory] = "menuFactory-any MenuFactory"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {

    }
}
extension BookmarkListComponent: Registration {
    public func registerItems() {
        keyPathToName[\BookmarkListDependency.fetchBookmarkListUseCase] = "fetchBookmarkListUseCase-any FetchBookmarkListUseCase"
        keyPathToName[\BookmarkListDependency.bookmarkUseCase] = "bookmarkUseCase-any BookmarkUseCase"
        keyPathToName[\BookmarkListDependency.recruitmentFactory] = "recruitmentFactory-any RecruitmentFactory"
        keyPathToName[\BookmarkListDependency.recruitmentDetailFactory] = "recruitmentDetailFactory-any RecruitmentDetailFactory"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinFactory] = "signinFactory-any SigninFactory"
        keyPathToName[\RootDependency.mainTabFactory] = "mainTabFactory-any MainTabFactory"
        keyPathToName[\RootDependency.splashFactory] = "splashFactory-any SplashFactory"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
        keyPathToName[\SigninDependency.signupFactory] = "signupFactory-any SignupFactory"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchApplicationUseCase] = "fetchApplicationUseCase-any FetchApplicationUseCase"
        keyPathToName[\HomeDependency.fetchTotalPassStudentUseCase] = "fetchTotalPassStudentUseCase-any FetchTotalPassStudentUseCase"
        keyPathToName[\HomeDependency.fetchStudentInfoUseCase] = "fetchStudentInfoUseCase-any FetchStudentInfoUseCase"
        keyPathToName[\HomeDependency.recruitmentFactory] = "recruitmentFactory-any RecruitmentFactory"
        keyPathToName[\HomeDependency.findCompanyFactory] = "findCompanyFactory-any FindCompanyFactory"
    }
}
extension FindCompanyComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindCompanyDependency.fetchStudentCompanyListUseCase] = "fetchStudentCompanyListUseCase-any FetchStudentCompanyListUseCase"
        keyPathToName[\FindCompanyDependency.findCompanyDetailFactory] = "findCompanyDetailFactory-any FindCompanyDetailFactory"
    }
}
extension FindCompanyDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindCompanyDetailDependency.fetchCompanyInfoDetailUseCase] = "fetchCompanyInfoDetailUseCase-any FetchCompanyInfoDetailUseCase"
        keyPathToName[\FindCompanyDetailDependency.fetchReviewListUseCase] = "fetchReviewListUseCase-any FetchReviewListUseCase"
    }
}
extension RecruitmentComponent: Registration {
    public func registerItems() {
        keyPathToName[\RecruitmentDependency.fetchRecruitmentListUseCase] = "fetchRecruitmentListUseCase-any FetchRecruitmentListUseCase"
        keyPathToName[\RecruitmentDependency.bookmarkUseCase] = "bookmarkUseCase-any BookmarkUseCase"
        keyPathToName[\RecruitmentDependency.fetchCodesUseCase] = "fetchCodesUseCase-any FetchCodesUseCase"
        keyPathToName[\RecruitmentDependency.recruitmentDetailFactory] = "recruitmentDetailFactory-any RecruitmentDetailFactory"
    }
}
extension RecruitmentDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\RecruitmentDetailDependency.fetchRecruitmentDetailUseCase] = "fetchRecruitmentDetailUseCase-any FetchRecruitmentDetailUseCase"
        keyPathToName[\RecruitmentDetailDependency.findCompanyDetailFactory] = "findCompanyDetailFactory-any FindCompanyDetailFactory"
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
    registerProviderFactory("^->AppComponent->BookmarkListComponent", factory4fe746186ebb99322754f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindCompanyComponent", factory161fb699dfcd446598cbf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindCompanyDetailComponent", factoryca6789757d5d9bbb6659f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RecruitmentComponent", factoryb1923ea1b010875d9389f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RecruitmentDetailComponent", factory14d63d6fecffe94dd0e1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MenuComponent", factory9727a582143c5cd40ff3e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
