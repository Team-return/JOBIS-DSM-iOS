import NeedleFoundation
import SwiftUI
import MenuFeature
import HomeFeature
import MyPageFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
    var myPageComponent: MyPageComponent { get }
    var menuComponent: MenuComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent,
            myPageComponent: dependency.myPageComponent,
            menuComponent: dependency.menuComponent
        )
    }
}
