import NeedleFoundation
import SwiftUI
import MainTabFeatureInterface
import MenuFeatureInterface
import HomeFeatureInterface
import BookmarkListFeatureInterface
import MyPageFeatureInterface

public protocol MainTabDependency: Dependency {
    var homeFactory: any HomeFactory { get }
    var bookmarkListFactory: any BookmarkListFactory { get }
    var myPageFactory: any MyPageFactory { get }
    var menuFactory: any MenuFactory { get }
}

public final class MainTabComponent: Component<MainTabDependency>, MainTabFactory {
    public func makeView() -> some View {
        MainTabView(
            homeFactory: dependency.homeFactory,
            bookmarkListFactory: dependency.bookmarkListFactory,
            myPageFactory: dependency.myPageFactory,
            menuFactory: dependency.menuFactory
        )
    }
}
