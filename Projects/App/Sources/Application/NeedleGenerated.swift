

import ApplicationsDomain
import ApplicationsDomainInterface
import AuthDomain
import AuthDomainInterface
import BookmarkListFeature
import BookmarkListFeatureInterface
import BookmarksDomain
import BookmarksDomainInterface
import BugsDomain
import BugsDomainInterface
import CodesDomain
import CodesDomainInterface
import CompaniesDomain
import CompaniesDomainInterface
import DesignSystem
import FilesDomain
import FilesDomainInterface
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
import RenewalPasswordFeature
import RenewalPasswordFeatureInterface
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
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase {
        return appComponent.fetchStudentInfoUseCase
    }
    var logoutUseCase: any LogoutUseCase {
        return appComponent.logoutUseCase
    }
    var uploadFilesUseCase: any UploadFilesUseCase {
        return appComponent.uploadFilesUseCase
    }
    var changeProfileImageUseCase: any ChangeProfileImageUseCase {
        return appComponent.changeProfileImageUseCase
    }
    var reportFactory: any ReportFactory {
        return appComponent.reportFactory
    }
    var checkPasswordFactory: any CheckPasswordFactory {
        return appComponent.checkPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class ModifyPasswordDependency8e8e0713c7893c69f342Provider: ModifyPasswordDependency {
    var changePasswordUseCase: any ChangePasswordUseCase {
        return appComponent.changePasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ModifyPasswordComponent
private func factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ModifyPasswordDependency8e8e0713c7893c69f342Provider(appComponent: parent1(component) as! AppComponent)
}
private class CheckPasswordDependencyd8ff624643356835c570Provider: CheckPasswordDependency {
    var compareCurrentPassswordUseCase: any CompareCurrentPassswordUseCase {
        return appComponent.compareCurrentPassswordUseCase
    }
    var modifyPasswordFactory: any ModifyPasswordFactory {
        return appComponent.modifyPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CheckPasswordComponent
private func factorycb24ea072925f86bef40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CheckPasswordDependencyd8ff624643356835c570Provider(appComponent: parent1(component) as! AppComponent)
}
private class ReportDependency6e94b8b26a4d1950e6e6Provider: ReportDependency {
    var reportBugsUseCase: any ReportBugsUseCase {
        return appComponent.reportBugsUseCase
    }
    var uploadFilesUseCase: any UploadFilesUseCase {
        return appComponent.uploadFilesUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ReportComponent
private func factoryf9f7e1c92faf5c6d60daf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ReportDependency6e94b8b26a4d1950e6e6Provider(appComponent: parent1(component) as! AppComponent)
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
    var authenticationEmailFactory: any AuthenticationEmailFactory {
        return appComponent.authenticationEmailFactory
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
    var recruitmentDetailFactory: any RecruitmentDetailFactory {
        return appComponent.recruitmentDetailFactory
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
private class AuthenticationEmailDependency73189eb572618b10e0fbProvider: AuthenticationEmailDependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var renewalPasswordFactory: any RenewalPasswordFactory {
        return appComponent.renewalPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AuthenticationEmailComponent
private func factory8798d0becd9d2870112af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthenticationEmailDependency73189eb572618b10e0fbProvider(appComponent: parent1(component) as! AppComponent)
}
private class RenewalPasswordDependencya722dc02d5f3ad3403cfProvider: RenewalPasswordDependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        return appComponent.renewalPasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RenewalPasswordComponent
private func factory236a429a80d834e1f370f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RenewalPasswordDependencya722dc02d5f3ad3403cfProvider(appComponent: parent1(component) as! AppComponent)
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
    var uploadFilesUseCase: any UploadFilesUseCase {
        return appComponent.uploadFilesUseCase
    }
    var applyCompanyUseCase: any ApplyCompanyUseCase {
        return appComponent.applyCompanyUseCase
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
    var recruitmentFactory: any RecruitmentFactory {
        return appComponent.recruitmentFactory
    }
    var findCompanyFactory: any FindCompanyFactory {
        return appComponent.findCompanyFactory
    }
    var bookmarkListFactory: any BookmarkListFactory {
        return appComponent.bookmarkListFactory
    }
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MenuComponent
private func factory9727a582143c5cd40ff3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MenuDependency43a0e3ba5712a2a90856Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-any Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["localAuthDataSource-any LocalAuthDataSource"] = { [unowned self] in self.localAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { [unowned self] in self.sendAuthCodeUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { [unowned self] in self.verifyAuthCodeUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["remoteRecruitmentsDataSource-any RemoteRecruitmentsDataSource"] = { [unowned self] in self.remoteRecruitmentsDataSource as Any }
        localTable["recruitmentsRepository-any RecruitmentsRepository"] = { [unowned self] in self.recruitmentsRepository as Any }
        localTable["fetchRecruitmentDetailUseCase-any FetchRecruitmentDetailUseCase"] = { [unowned self] in self.fetchRecruitmentDetailUseCase as Any }
        localTable["fetchRecruitmentListUseCase-any FetchRecruitmentListUseCase"] = { [unowned self] in self.fetchRecruitmentListUseCase as Any }
        localTable["remoteBugsDataSource-any RemoteBugsDataSource"] = { [unowned self] in self.remoteBugsDataSource as Any }
        localTable["bugsRepository-any BugsRepository"] = { [unowned self] in self.bugsRepository as Any }
        localTable["reportBugsUseCase-any ReportBugsUseCase"] = { [unowned self] in self.reportBugsUseCase as Any }
        localTable["signinFactory-any SigninFactory"] = { [unowned self] in self.signinFactory as Any }
        localTable["authenticationEmailFactory-any AuthenticationEmailFactory"] = { [unowned self] in self.authenticationEmailFactory as Any }
        localTable["renewalPasswordFactory-any RenewalPasswordFactory"] = { [unowned self] in self.renewalPasswordFactory as Any }
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
        localTable["reportFactory-any ReportFactory"] = { [unowned self] in self.reportFactory as Any }
        localTable["checkPasswordFactory-any CheckPasswordFactory"] = { [unowned self] in self.checkPasswordFactory as Any }
        localTable["modifyPasswordFactory-any ModifyPasswordFactory"] = { [unowned self] in self.modifyPasswordFactory as Any }
        localTable["menuFactory-any MenuFactory"] = { [unowned self] in self.menuFactory as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { [unowned self] in self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { [unowned self] in self.studentsRepository as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { [unowned self] in self.renewalPasswordUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { [unowned self] in self.signupUseCase as Any }
        localTable["studentExistsUseCase-any StudentExistsUseCase"] = { [unowned self] in self.studentExistsUseCase as Any }
        localTable["fetchStudentInfoUseCase-any FetchStudentInfoUseCase"] = { [unowned self] in self.fetchStudentInfoUseCase as Any }
        localTable["compareCurrentPassswordUseCase-any CompareCurrentPassswordUseCase"] = { [unowned self] in self.compareCurrentPassswordUseCase as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in self.changePasswordUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { [unowned self] in self.changeProfileImageUseCase as Any }
        localTable["remoteBookmarksDataSource-any RemoteBookmarksDataSource"] = { [unowned self] in self.remoteBookmarksDataSource as Any }
        localTable["bookmarksRepository-any BookmarksRepository"] = { [unowned self] in self.bookmarksRepository as Any }
        localTable["fetchBookmarkListUseCase-any FetchBookmarkListUseCase"] = { [unowned self] in self.fetchBookmarkListUseCase as Any }
        localTable["bookmarkUseCase-any BookmarkUseCase"] = { [unowned self] in self.bookmarkUseCase as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { [unowned self] in self.remoteUsersDataSource as Any }
        localTable["usersRepository-any UsersRepository"] = { [unowned self] in self.usersRepository as Any }
        localTable["signinUseCase-any SigninUseCase"] = { [unowned self] in self.signinUseCase as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { [unowned self] in self.remoteFilesDataSource as Any }
        localTable["filesRepository-any FilesRepository"] = { [unowned self] in self.filesRepository as Any }
        localTable["uploadFilesUseCase-any UploadFilesUseCase"] = { [unowned self] in self.uploadFilesUseCase as Any }
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
        keyPathToName[\MyPageDependency.fetchStudentInfoUseCase] = "fetchStudentInfoUseCase-any FetchStudentInfoUseCase"
        keyPathToName[\MyPageDependency.logoutUseCase] = "logoutUseCase-any LogoutUseCase"
        keyPathToName[\MyPageDependency.uploadFilesUseCase] = "uploadFilesUseCase-any UploadFilesUseCase"
        keyPathToName[\MyPageDependency.changeProfileImageUseCase] = "changeProfileImageUseCase-any ChangeProfileImageUseCase"
        keyPathToName[\MyPageDependency.reportFactory] = "reportFactory-any ReportFactory"
        keyPathToName[\MyPageDependency.checkPasswordFactory] = "checkPasswordFactory-any CheckPasswordFactory"
    }
}
extension ModifyPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ModifyPasswordDependency.changePasswordUseCase] = "changePasswordUseCase-any ChangePasswordUseCase"
    }
}
extension CheckPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\CheckPasswordDependency.compareCurrentPassswordUseCase] = "compareCurrentPassswordUseCase-any CompareCurrentPassswordUseCase"
        keyPathToName[\CheckPasswordDependency.modifyPasswordFactory] = "modifyPasswordFactory-any ModifyPasswordFactory"
    }
}
extension ReportComponent: Registration {
    public func registerItems() {
        keyPathToName[\ReportDependency.reportBugsUseCase] = "reportBugsUseCase-any ReportBugsUseCase"
        keyPathToName[\ReportDependency.uploadFilesUseCase] = "uploadFilesUseCase-any UploadFilesUseCase"
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
        keyPathToName[\SigninDependency.authenticationEmailFactory] = "authenticationEmailFactory-any AuthenticationEmailFactory"
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
        keyPathToName[\FindCompanyDetailDependency.recruitmentDetailFactory] = "recruitmentDetailFactory-any RecruitmentDetailFactory"
    }
}
extension AuthenticationEmailComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthenticationEmailDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.renewalPasswordFactory] = "renewalPasswordFactory-any RenewalPasswordFactory"
    }
}
extension RenewalPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\RenewalPasswordDependency.renewalPasswordUseCase] = "renewalPasswordUseCase-any RenewalPasswordUseCase"
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
        keyPathToName[\RecruitmentDetailDependency.uploadFilesUseCase] = "uploadFilesUseCase-any UploadFilesUseCase"
        keyPathToName[\RecruitmentDetailDependency.applyCompanyUseCase] = "applyCompanyUseCase-any ApplyCompanyUseCase"
        keyPathToName[\RecruitmentDetailDependency.findCompanyDetailFactory] = "findCompanyDetailFactory-any FindCompanyDetailFactory"
    }
}
extension MenuComponent: Registration {
    public func registerItems() {
        keyPathToName[\MenuDependency.recruitmentFactory] = "recruitmentFactory-any RecruitmentFactory"
        keyPathToName[\MenuDependency.findCompanyFactory] = "findCompanyFactory-any FindCompanyFactory"
        keyPathToName[\MenuDependency.bookmarkListFactory] = "bookmarkListFactory-any BookmarkListFactory"
        keyPathToName[\MenuDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
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
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ModifyPasswordComponent", factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CheckPasswordComponent", factorycb24ea072925f86bef40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ReportComponent", factoryf9f7e1c92faf5c6d60daf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->BookmarkListComponent", factory4fe746186ebb99322754f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindCompanyComponent", factory161fb699dfcd446598cbf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindCompanyDetailComponent", factoryca6789757d5d9bbb6659f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthenticationEmailComponent", factory8798d0becd9d2870112af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RenewalPasswordComponent", factory236a429a80d834e1f370f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RecruitmentComponent", factoryb1923ea1b010875d9389f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RecruitmentDetailComponent", factory14d63d6fecffe94dd0e1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MenuComponent", factory9727a582143c5cd40ff3f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
