import DesignSystem
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    private let recruitmentComponent: RecruitmentComponent

    init(
        viewModel: HomeViewModel,
        recruitmentComponent: RecruitmentComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentComponent = recruitmentComponent
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.Sub.gray10.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    ImploymentPersentView(
                        totalStudentCount: viewModel.mainPageInfo?.totalStudentCount ?? 1,
                        passerCount: viewModel.mainPageInfo?.passCount ?? 0,
                        applyerCount: viewModel.mainPageInfo?.approvedCount ?? 0
                    )
                    .padding(.bottom, 40)

                    StudentInfoView(
                        name: viewModel.mainPageInfo?.studentName ?? "",
                        gcn: viewModel.mainPageInfo?.studentGcn ?? ""
                    )

                    ApplicationStatusView(applicationList: viewModel.mainPageInfo?.applyCompanies ?? [])

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
                            image: HomeImage(.findWorkspace)
                        ) {
                            viewModel.isNavigateFindWorkSpace.toggle()
                        }
                    }
                    .padding(22)
                    .padding(.bottom, 10)
                    .background(Color.Sub.gray20)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear {
            viewModel.onAppear()
        }
        .navigate(to: recruitmentComponent.makeView(), when: $viewModel.isNavigateRecruitment)
        .navigate(to: Text("기업찾기 뷰"), when: $viewModel.isNavigateFindWorkSpace)
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
