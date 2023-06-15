import SwiftUI
import BookmarkListFeatureInterface
import MenuFeatureInterface
import HomeFeatureInterface
import MyPageFeatureInterface
import BaseFeature
import DesignSystem
import UtilityModule

// swiftlint: disable large_tuple
struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    var tabItem: [(Image, String, TabFlow)] = [
        (DesignSystemAsset.Icons.house.swiftUIImage, "홈", .home),
        (DesignSystemAsset.Icons.bookmark.swiftUIImage, "북마크", .bookmark),
        (DesignSystemAsset.Icons.profile.swiftUIImage, "마이페이지", .profile),
        (DesignSystemAsset.Icons.menu.swiftUIImage, "메뉴", .menu)
    ]

    private let homeFactory: any HomeFactory
    private let bookmarkListFactory: any BookmarkListFactory
    private let myPageFactory: any MyPageFactory
    private let menuFactory: any MenuFactory

    init(
        homeFactory: any HomeFactory,
        bookmarkListFactory: any BookmarkListFactory,
        myPageFactory: any MyPageFactory,
        menuFactory: any MenuFactory
    ) {
        self.homeFactory = homeFactory
        self.bookmarkListFactory = bookmarkListFactory
        self.myPageFactory = myPageFactory
        self.menuFactory = menuFactory
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeFactory.makeView()
                    .eraseToAnyView()
                    .tag(TabFlow.home)

                bookmarkListFactory.makeView()
                    .eraseToAnyView()
                    .tag(TabFlow.bookmark)

                myPageFactory.makeView()
                    .eraseToAnyView()
                    .tag(TabFlow.profile)

                menuFactory.makeView()
                    .eraseToAnyView()
                    .tag(TabFlow.menu)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.Sub.gray10
                                .cornerRadius(10, corners: [.topLeft, .topRight])
                                .ignoresSafeArea()
                                .shadow(opacity: 0.1, y: -2, blur: 4)
                        }
                        .environment(\.jobisSelectionTabbKey, $selection)
                }
            }
        }
        .onChange(of: tabbarHidden) { _ in
            UITabBar.hideTabBar()
        }
        .environment(\.jobisSelectionTabbKey, $selection)
    }

    @ViewBuilder
    func tabbarView() -> some View {
        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { image, title, tag in
                tabItemView(image: image, title: title, tag: tag)
                    .frame(width: 56, height: 60)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(image: Image, title: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            VStack(spacing: 1) {
                image
                    .renderingMode(.template)
                    .foregroundColor(tag == selection ? .Main.lightBlue : .Sub.gray50)

                if tag == selection {
                    Text(title)
                        .JOBISFont(.etc(.caption), color: .Main.lightBlue)
                }
            }
            .padding(.vertical, 18)
        }
    }
}
