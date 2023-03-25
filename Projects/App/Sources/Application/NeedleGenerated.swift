

import HomeFeature
import HomeFeatureInterface
import KeychainModule
import MainTabFeature
import MainTabFeatureInterface
import MenuFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import NeedleFoundation
import RootFeature
import RootFeatureInterface
import SigninFeature
import SigninFeatureInterface
import SignupFeatureInterface
import SplashFeature
import SplashFeatureInterface
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash: String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {


    init() { 

    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider()
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {


    init() {

    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-any Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["schoolCodeComponent-SchoolCodeComponent"] = { [unowned self] in self.schoolCodeComponent as Any }
        localTable["findIDComponent-FindIDComponent"] = { [unowned self] in self.findIDComponent as Any }
        localTable["signinComponent-SigninComponent"] = { [unowned self] in self.signinComponent as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
        localTable["schoolConfirmationQuestionsComponent-SchoolConfirmationQuestionsComponent"] = { [unowned self] in self.schoolConfirmationQuestionsComponent as Any }
        localTable["signupEmailVerifyComponent-SignupEmailVerifyComponent"] = { [unowned self] in self.signupEmailVerifyComponent as Any }
        localTable["signupEmailAuthCodeVerifyComponent-SignupEmailAuthCodeVerifyComponent"] = { [unowned self] in self.signupEmailAuthCodeVerifyComponent as Any }
        localTable["idSettingComponent-IDSettingComponent"] = { [unowned self] in self.idSettingComponent as Any }
        localTable["enterInformationComponent-EnterInformationComponent"] = { [unowned self] in self.enterInformationComponent as Any }
        localTable["authenticationEmailComponent-AuthenticationEmailComponent"] = { [unowned self] in self.authenticationEmailComponent as Any }
        localTable["changePasswordComponent-ChangePasswordComponent"] = { [unowned self] in self.changePasswordComponent as Any }
        localTable["signupProfileImageComponent-SignupProfileImageComponent"] = { [unowned self] in self.signupProfileImageComponent as Any }
        localTable["signupPasswordComponent-SignupPasswordComponent"] = { [unowned self] in self.signupPasswordComponent as Any }
        localTable["signupTermsComponent-SignupTermsComponent"] = { [unowned self] in self.signupTermsComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { [unowned self] in self.mainTabComponent as Any }
        localTable["homeComponent-HomeComponent"] = { [unowned self] in self.homeComponent as Any }
        localTable["studyRoomDetailComponent-StudyRoomDetailComponent"] = { [unowned self] in self.studyRoomDetailComponent as Any }
        localTable["noticeListComponent-NoticeListComponent"] = { [unowned self] in self.noticeListComponent as Any }
        localTable["myPageComponent-MyPageComponent"] = { [unowned self] in self.myPageComponent as Any }
        localTable["changeProfileComponent-ChangeProfileComponent"] = { [unowned self] in self.changeProfileComponent as Any }
        localTable["noticeDetailComponent-NoticeDetailComponent"] = { [unowned self] in self.noticeDetailComponent as Any }
        localTable["rewardPointDetailComponent-RewardPointDetailComponent"] = { [unowned self] in self.rewardPointDetailComponent as Any }
        localTable["checkPasswordComponent-CheckPasswordComponent"] = { [unowned self] in self.checkPasswordComponent as Any }
        localTable["modifyPasswordComponent-ModifyPasswordComponent"] = { [unowned self] in self.modifyPasswordComponent as Any }
        localTable["studyRoomListComponent-StudyRoomListComponent"] = { [unowned self] in self.studyRoomListComponent as Any }
        localTable["applyPageComponent-ApplyPageComponent"] = { [unowned self] in self.applyPageComponent as Any }
        localTable["remainApplyComponent-RemainApplyComponent"] = { [unowned self] in self.remainApplyComponent as Any }
    }
}
extension SplashComponent: Registration {
    public func registerItems() {

    }
}
extension HomeComponent: Registration {
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
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
