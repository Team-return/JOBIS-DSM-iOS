import RootFeatureInterface
import NeedleFoundation
import SwiftUI
import AuthFeature
import MainTabFeature
import SplashFeature

public protocol RootDependency: Dependency {
    var authComponent: AuthComponent { get }
    var mainTabComponent: MainTabComponent { get }
    var splashComponent: SplashComponent { get }
}

public final class RootComponent: Component<RootDependency>, RootFactory {
    public func makeView() -> some View {
        RootView(
            authComponent: self.dependency.authComponent,
            mainTabComponent: self.dependency.mainTabComponent,
            splashComponent: self.dependency.splashComponent
        )
    }
}
