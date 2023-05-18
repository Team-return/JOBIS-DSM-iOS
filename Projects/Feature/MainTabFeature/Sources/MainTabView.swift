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
        (DesignSystemAsset.Icons.house.swiftUIImage, "홈", .home),
        (DesignSystemAsset.Icons.recruitment.swiftUIImage, "의뢰서", .recruitment),
        (DesignSystemAsset.Icons.profile.swiftUIImage, "프로필", .profile),
        (DesignSystemAsset.Icons.menu.swiftUIImage, "메뉴", .menu)
    ]

    private let homeComponent: HomeComponent
//    private let recruitmentComponent: RecruitmentComponent
    private let myPageComponent: MyPageComponent
    private let menuComponent: MenuComponent

    init(
        homeComponent: HomeComponent,
//        recruitmentComponent: RecruitmentComponent,
        myPageComponent: MyPageComponent,
        menuComponent: MenuComponent
    ) {
        self.homeComponent = homeComponent
//        self.recruitmentComponent = recruitmentComponent
        self.myPageComponent = myPageComponent
        self.menuComponent = menuComponent
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeComponent.makeView()
                    .tag(TabFlow.home)

                Text("임시 RecruitmentComponent.makeView()")
                    .tag(TabFlow.recruitment)

                myPageComponent.makeView()
                    .tag(TabFlow.profile)

                menuComponent.makeView()
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
                        }
                        .shadow(opacity: 0.1, y: -2, blur: 4)
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
