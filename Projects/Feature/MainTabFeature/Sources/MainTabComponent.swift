import NeedleFoundation
import SwiftUI
import MenuFeature
import HomeFeature
import MyPageFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
    var menuComponent: MenuComponent { get }
    var myPageComponent: MyPageComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent,
            menuComponent: dependency.menuComponent,
            myPageComponent: dependency.myPageComponent
        )
    }
}
