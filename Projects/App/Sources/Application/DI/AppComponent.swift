import NeedleFoundation
import SwiftUI
import JwtStoreInterface
import RootFeature
import RootFeatureInterface
import SigninFeature
import SigninFeatureInterface
import RenewalPasswordFeature
import RenewalPasswordFeatureInterface
import SignupFeature
import SignupFeatureInterface
import MainTabFeature
import MainTabFeatureInterface
import HomeFeature
import HomeFeatureInterface
import FindCompanyFeature
import FindCompanyFeatureInterface
import RecruitmentFeature
import RecruitmentFeatureInterface
import BookmarkListFeature
import BookmarkListFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import MenuFeature
import MenuFeatureInterface
import SplashFeature
import SplashFeatureInterface

public final class AppComponent: BootstrapComponent {
    private let _keychain: any Keychain

    init(keychain: any Keychain) {
        self._keychain = keychain
    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var keychain: any Keychain {
        shared {
            _keychain
        }
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

public extension AppComponent {
    var signinFactory: any SigninFactory {
        SigninComponent(parent: self)
    }
    var authenticationEmailFactory: any AuthenticationEmailFactory {
        AuthenticationEmailComponent(parent: self)
    }
    var renewalPasswordFactory: any RenewalPasswordFactory {
        RenewalPasswordComponent(parent: self)
    }
    var signupFactory: any SignupFactory {
        SignupComponent(parent: self)
    }
    var splashFactory: any SplashFactory {
        SplashComponent(parent: self)
    }
    var mainTabFactory: any MainTabFactory {
        MainTabComponent(parent: self)
    }
    var recruitmentFactory: any RecruitmentFactory {
        RecruitmentComponent(parent: self)
    }
    var recruitmentDetailFactory: any RecruitmentDetailFactory {
        RecruitmentDetailComponent(parent: self)
    }
    var findCompanyFactory: any FindCompanyFactory {
        FindCompanyComponent(parent: self)
    }
    var findCompanyDetailFactory: any FindCompanyDetailFactory {
        FindCompanyDetailComponent(parent: self)
    }
    var bookmarkListFactory: any BookmarkListFactory {
        BookmarkListComponent(parent: self)
    }
    var homeFactory: any HomeFactory {
        HomeComponent(parent: self)
    }
    var myPageFactory: any MyPageFactory {
        MyPageComponent(parent: self)
    }
    var reportFactory: any ReportFactory {
        ReportComponent(parent: self)
    }
    var checkPasswordFactory: any CheckPasswordFactory {
        CheckPasswordComponent(parent: self)
    }
    var modifyPasswordFactory: any ModifyPasswordFactory {
        ModifyPasswordComponent(parent: self)
    }
    var menuFactory: any MenuFactory {
        MenuComponent(parent: self)
    }
}
