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

                    StudentInfoView(studentInfo: viewModel.studentInfo)

                    ApplicationStatusView(
                        selectedId: $viewModel.selectedId,
                        applicationList: viewModel.applicationList?.applications
                    )

                    Spacer()

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            navigateButton(
                                text: "모집의뢰서\n조회하기",
                                image: .recruitmentImage
                            ) {
                                viewModel.isNavigateRecruitment.toggle()
                            }
                            .frame(width: proxy.size.width / 2)

                            navigateButton(
                                text: "기업찾기\n ",
                                image: .findCompanyImage
                            ) {
                                viewModel.isNavigateFindCompany.toggle()
                            }

                            navigateButton(
                                text: "겨울인턴\n ",
                                image: .winterInternImage
                            ) {
                                viewModel.isNavigateWinterIntern.toggle()
                            }
                        }
                        .padding(22)
                    }
                    .padding(.bottom, 100)
                    .background(Color.Sub.gray20)
                }
            }
        }
        .ignoresSafeArea()
        .reApplySheet(
            isPresented: $viewModel.showReApplySheet,
            urls: $viewModel.urls,
            documents: $viewModel.documents,
            rejectionReason: viewModel.rejectionReason
        ) {
            viewModel.apply {
                viewModel.dismissSheet()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(
            of: viewModel.isNavigateRecruitment || viewModel.isNavigateFindCompany || viewModel.isNavigateWinterIntern
        ) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .navigate(
            to: recruitmentFactory.makeView(winterIntern: false)
                .eraseToAnyView(),
            when: $viewModel.isNavigateRecruitment
        )
        .navigate(
            to: recruitmentFactory.makeView(winterIntern: true)
                .eraseToAnyView(),
            when: $viewModel.isNavigateWinterIntern
        )
        .navigate(
            to: findCompanyFactory.makeView()
                .eraseToAnyView(),
            when: $viewModel.isNavigateFindCompany
        )
        .jobisToast(
            isShowing: $viewModel.isShowErrorToast,
            message: viewModel.errorMessage,
            style: .error,
            title: "지원 불가"
        )
        .jobisToast(
            isShowing: $viewModel.isSuccessApply,
            message: "성공적으로 지원되셨습니다.",
            style: .success,
            title: "지원 성공"
        )
        .navigationTitle("홈")
        .navigationBarHidden(true)
    }

    @ViewBuilder
    func navigateButton(
        text: String,
        image: JOBISImage.Image,
        action: @escaping () -> Void
    ) -> some View {
        let texts = text.components(separatedBy: "\n")
        Button(action: action) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(texts, id: \.self) { text in
                            Text(text)
                                .JOBISFont(.body(.body1), color: .Sub.gray80)
                        }
                    }

                    Spacer()
                }
                .padding(.top, 22)
                .padding(.leading, 24)

                HStack {
                    Spacer()

                    if image == .winterInternImage {
                        JOBISImage(image)
                            .frame(width: 63, height: 68)
                            .padding(.vertical, (96 - 68)/2)
                            .padding(.trailing, (96 - 68)/2)
                    } else {
                        JOBISImage(image)
                            .frame(width: 96, height: 96)
                    }
                }
                .padding(.bottom, 8)
                .padding(.trailing, 7)
            }
            .frame(minWidth: 122)
            .background(Color.Sub.gray10)
            .cornerRadius(10)
            .shadow(opacity: 0.1, y: 1, blur: 10)
        }
    }
}
