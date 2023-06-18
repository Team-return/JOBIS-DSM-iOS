import SwiftUI
import DesignSystem
import MenuFeatureInterface
import RecruitmentFeatureInterface
import FindCompanyFeatureInterface
import BookmarkListFeatureInterface
import MyPageFeatureInterface
import NeedleFoundation

public protocol MenuDependency: Dependency {
    var recruitmentFactory: any RecruitmentFactory { get }
    var findCompanyFactory: any FindCompanyFactory { get }
    var bookmarkListFactory: any BookmarkListFactory { get }
    var myPageFactory: any MyPageFactory { get }
}

public final class MenuComponent: Component<MenuDependency>, MenuFactory {
    public func makeView() -> some View {
        NavigationView {
            MenuView(
                viewModel: .init(),
                myPageFactory: dependency.myPageFactory,
                recruitmentFactory: dependency.recruitmentFactory,
                findCompanyFactory: dependency.findCompanyFactory,
                bookmarkListFactory: dependency.bookmarkListFactory
            )
        }
        .accentColor(.Sub.gray70)
    }
}
