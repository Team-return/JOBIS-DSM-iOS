import DesignSystem
import RecruitmentFeatureInterface
import FindCompanyFeatureInterface
import BookmarkListFeatureInterface
import MyPageFeatureInterface
import UtilityModule
import SwiftUI

struct MenuView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: MenuViewModel

    private let myPageFactory: any MyPageFactory
    private let recruitmentFactory: any RecruitmentFactory
    private let findCompanyFactory: any FindCompanyFactory
    private let bookmarkListFactory: any BookmarkListFactory

    init(
        viewModel: MenuViewModel,
        myPageFactory: any MyPageFactory,
        recruitmentFactory: any RecruitmentFactory,
        findCompanyFactory: any FindCompanyFactory,
        bookmarkListFactory: any BookmarkListFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.myPageFactory = myPageFactory
        self.recruitmentFactory = recruitmentFactory
        self.findCompanyFactory = findCompanyFactory
        self.bookmarkListFactory = bookmarkListFactory
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Divider().foregroundColor(.Sub.gray40)
                    .padding(.bottom, 25)

                Group {
                    menuTitle(title: "사용자")

                    menuListCell(image: .profile, title: "마이페이지")
                        .padding(.bottom, 20)
                }

                Group {
                    menuTitle(title: "기업")

                    menuListCell(image: .fetchRecruitment, title: "모집의뢰서 조회하기")

                    menuListCell(image: .winterInternImage, title: "겨울인턴 조회하기")

                    menuListCell(image: .findCompany, title: "기업 찾기")

                    menuListCell(image: .bookmarkList, title: "북마크한 기업 보기")
                }
            }
            .padding(.horizontal, 20)
        }
        .navigate(
            to: myPageFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateMyPage
        )
        .navigate(
            to: recruitmentFactory.makeView(winterIntern: false).eraseToAnyView(),
            when: $viewModel.isNavigateRecruitmentView
        )
        .navigate(
            to: recruitmentFactory.makeView(winterIntern: true).eraseToAnyView(),
            when: $viewModel.isNavigateWinterInternView
        )
        .navigate(
            to: findCompanyFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateCompanyView
        )
        .navigate(
            to: bookmarkListFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateBookmarkListView
        )
        .onChange(of: viewModel.isTabbarHidden) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .navigationTitle("메뉴")
    }

    @ViewBuilder
    func menuTitle(title: String) -> some View {
        Text(title)
            .JOBISFont(.body(.body3), color: .Sub.gray60)
            .padding(.bottom, 5)
    }

    @ViewBuilder
    func menuListCell(image: JOBISImage.Image, title: String) -> some View {
        Button {
            switch image {
            case .bookmarkList:
                viewModel.isNavigateBookmarkListView.toggle()

            case .fetchRecruitment:
                viewModel.isNavigateRecruitmentView.toggle()

            case .findCompany:
                viewModel.isNavigateCompanyView.toggle()

            case .profile:
                viewModel.isNavigateMyPage.toggle()

            case .winterInternImage:
                viewModel.isNavigateWinterInternView.toggle()

            default: break
            }
        } label: {
            HStack(spacing: 12) {
                JOBISImage(image)
                    .frame(width: 24, height: 24)

                Text(title)
                    .JOBISFont(.body(.body2), color: .Sub.gray80)

                Spacer()
            }
        }
        .padding(.bottom, 10)
    }
}
