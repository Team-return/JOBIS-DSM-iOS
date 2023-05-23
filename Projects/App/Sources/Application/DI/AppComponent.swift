import NeedleFoundation
import SwiftUI
import JwtStoreInterface
import RootFeature
import SigninFeature
import SignupFeature
import MainTabFeature
import HomeFeature
import MyPageFeature
import MenuFeature
import SplashFeature

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
        shared {
            RootComponent(parent: self)
        }
    }
}

// MARK: - Auth
public extension AppComponent {
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
    var signupComponent: SignupComponent {
        SignupComponent(parent: self)
    }
    var splashComponent: SplashComponent {
        SplashComponent(parent: self)
    }
}

// MARK: - Main
public extension AppComponent {
    var mainTabComponent: MainTabComponent {
        MainTabComponent(parent: self)
    }
    var recruitmentComponent: RecruitmentComponent {
        RecruitmentComponent(parent: self)
    }
    var homeComponent: HomeComponent {
        HomeComponent(parent: self)
    }
    var myPageComponent: MyPageComponent {
        MyPageComponent(parent: self)
    }
    var menuComponent: MenuComponent {
        MenuComponent(parent: self)
    }
}
