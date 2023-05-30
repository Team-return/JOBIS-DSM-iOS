import DesignSystem
import FindCompanyFeatureInterface
import RecruitmentFeatureInterface
import SwiftUI
import UtilityModule

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @Environment(\.tabbarHidden) var tabbarHidden

    private let recruitmentFactory: any RecruitmentFactory
    private let findCompanyFactory: any FindCompanyFactory

    init(
        viewModel: HomeViewModel,
        recruitmentFactory: any RecruitmentFactory,
        findCompanyFactory: any FindCompanyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentFactory = recruitmentFactory
        self.findCompanyFactory = findCompanyFactory
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.Sub.gray10.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    ImploymentPersentView(totalPassStudent: viewModel.totalPassStudent)
                    .padding(.bottom, 40)

                    StudentInfoView(isLoading: $viewModel.isLoading, studentInfo: viewModel.studentInfo)

                    ApplicationStatusView(applicationList: viewModel.applicationList?.applications ?? [])

                    Spacer()

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    HStack(spacing: 12) {
                        navigateButton(
                            text: "모집의뢰서\n조회하기",
                            image: HomeImage(.recruitment)
                        ) {
                            viewModel.isNavigateRecruitment.toggle()
                        }
                        .frame(width: proxy.size.width / 2)

                        navigateButton(
                            text: "기업찾기\n",
                            image: HomeImage(.findCompany)
                        ) {
                            viewModel.isNavigateFindCompany.toggle()
                        }
                    }
                    .padding(22)
                    .padding(.bottom, 100)
                    .background(Color.Sub.gray20)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: viewModel.isNavigateRecruitment || viewModel.isNavigateFindCompany) {
            tabbarHidden.wrappedValue = $0
        }
        .navigate(
            to: recruitmentFactory.makeView()
                .eraseToAnyView(),
            when: $viewModel.isNavigateRecruitment
        )
        .navigate(
            to: findCompanyFactory.makeView()
                .eraseToAnyView(),
            when: $viewModel.isNavigateFindCompany
        )
    }

    @ViewBuilder
    func navigateButton(
        text: String,
        image: HomeImage,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack {
                HStack {
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .JOBISFont(.body(.body1), color: .Sub.gray80)

                    Spacer()
                }
                .padding(.top, 22)
                .padding(.leading, 24)

                HStack {
                    Spacer()

                    image
                        .frame(width: 96, height: 96)
                }
                .padding(.bottom, 8)
                .padding(.trailing, 7)
            }
            .background(Color.Sub.gray10)
            .cornerRadius(10)
            .shadow(opacity: 0.1, y: 1, blur: 10)
        }
    }
}
