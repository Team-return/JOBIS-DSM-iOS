import SwiftUI
import MenuFeature
import HomeFeature
import MyPageFeature
import BaseFeature
import DesignSystem
import UtilityModule

// swiftlint: disable large_tuple
struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    var tabItem: [(Image, String, TabFlow)] = [
        (DesignSystemAsset.Icons.menu.swiftUIImage, "메뉴", .menu),
        (DesignSystemAsset.Icons.house.swiftUIImage, "홈", .home),
        (DesignSystemAsset.Icons.mypage.swiftUIImage, "내 정보", .myPage)
    ]

    private let homeComponent: HomeComponent
    private let menuComponent: MenuComponent
    private let myPageComponent: MyPageComponent

    init(
        homeComponent: HomeComponent,
        menuComponent: MenuComponent,
        myPageComponent: MyPageComponent
    ) {
        self.homeComponent = homeComponent
        self.menuComponent = menuComponent
        self.myPageComponent = myPageComponent
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                menuComponent.makeView()
                    .tag(TabFlow.menu)

                homeComponent.makeView()
                    .tag(TabFlow.home)

                myPageComponent.makeView()
                    .tag(TabFlow.myPage)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.Sub.gray10
                                .cornerRadius(20, corners: [.topLeft, .topRight])
                                .ignoresSafeArea()
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
                    .frame(width: 56, height: 44)

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
            .padding(.top, 12)
            .padding(.bottom, 4)
        }
    }
}
