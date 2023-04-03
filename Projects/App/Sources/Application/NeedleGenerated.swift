

import ApplicationsDomain
import ApplicationsDomainInterface
import AuthDomain
import AuthDomainInterface
import BaseFeature
import CodeDomain
import CodeDomainInterface
import CompaniesDomain
import CompaniesDomainInterface
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
import UserDomain
import UserDomainInterface

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


    init() {

    }
}
/// ^->AppComponent->SignupComponent
private func factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupDependency1ff7d1355204bb65e850Provider()
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider()
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


    init() {

    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debcce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider()
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {


    init() {

    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider()
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
        localTable["remoteRecruitmentsDataSource-any RemoteRecruitmentsDataSource"] = { [unowned self] in self.remoteRecruitmentsDataSource as Any }
        localTable["recruitmentsRepository-any RecruitmentsRepository"] = { [unowned self] in self.recruitmentsRepository as Any }
        localTable["fetchRecruitmentDetailUseCase-any FetchRecruitmentDetailUseCase"] = { [unowned self] in self.fetchRecruitmentDetailUseCase as Any }
        localTable["fetchRecruitmentListUseCase-any FetchRecruitmentListUseCase"] = { [unowned self] in self.fetchRecruitmentListUseCase as Any }
        localTable["remoteCodeDataSource-any RemoteCodeDataSource"] = { [unowned self] in self.remoteCodeDataSource as Any }
        localTable["codeRepository-any CodeRepository"] = { [unowned self] in self.codeRepository as Any }
        localTable["fetchJobCodeUseCase-any FetchJobCodeUseCase"] = { [unowned self] in self.fetchJobCodeUseCase as Any }
        localTable["fetchTechCodeUseCase-any FetchTechCodeUseCase"] = { [unowned self] in self.fetchTechCodeUseCase as Any }
        localTable["localUserDataSource-any LocalUserDataSource"] = { [unowned self] in self.localUserDataSource as Any }
        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in self.remoteUserDataSource as Any }
        localTable["localUserRepository-any LocalUserRepository"] = { [unowned self] in self.localUserRepository as Any }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["loadJwtTokenUseCase-any LoadJwtTokenUseCase"] = { [unowned self] in self.loadJwtTokenUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["signinUseCase-any SigninUseCase"] = { [unowned self] in self.signinUseCase as Any }
        localTable["signinComponent-SigninComponent"] = { [unowned self] in self.signinComponent as Any }
        localTable["signupComponent-SignupComponent"] = { [unowned self] in self.signupComponent as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { [unowned self] in self.mainTabComponent as Any }
        localTable["homeComponent-HomeComponent"] = { [unowned self] in self.homeComponent as Any }
        localTable["myPageComponent-MyPageComponent"] = { [unowned self] in self.myPageComponent as Any }
        localTable["menuComponent-MenuComponent"] = { [unowned self] in self.menuComponent as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { [unowned self] in self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { [unowned self] in self.studentsRepository as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { [unowned self] in self.renewalPasswordUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { [unowned self] in self.signupUseCase as Any }
        localTable["remoteApplicationsDataSource-any RemoteApplicationsDataSource"] = { [unowned self] in self.remoteApplicationsDataSource as Any }
        localTable["applicationsRepository-any ApplicationsRepository"] = { [unowned self] in self.applicationsRepository as Any }
        localTable["applyCompanyUseCase-any ApplyCompanyUseCase"] = { [unowned self] in self.applyCompanyUseCase as Any }
        localTable["cancelApplyUseCase-any CancelApplyUseCase"] = { [unowned self] in self.cancelApplyUseCase as Any }
        localTable["fetchApplicationUseCase-any FetchApplicationUseCase"] = { [unowned self] in self.fetchApplicationUseCase as Any }
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

    }
}
extension MainTabComponent: Registration {
    public func registerItems() {

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

    }
}
extension HomeComponent: Registration {
    public func registerItems() {

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
    registerProviderFactory("^->AppComponent->SignupComponent", factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debcce3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MenuComponent", factory9727a582143c5cd40ff3e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
