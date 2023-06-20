import DesignSystem
import MyPageFeatureInterface
import SwiftUI
import UtilityModule
import Kingfisher
import BaseFeature

struct MyPageView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: MyPageViewModel

    private let reportFactory: any ReportFactory

    init(
        viewModel: MyPageViewModel,
        reportFactory: any ReportFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.reportFactory = reportFactory
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Divider().foregroundColor(.Sub.gray40)
                    .padding(.bottom, 50)

                Group {
                    KFImage(URL(string: viewModel.studentInfo?.profileImageUrl ?? ""))
                        .placeholder { Circle().fill(Color.Sub.gray50) }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 62, height: 62)
                        .clipShape(Circle())
                        .padding(.bottom, 5)

                    Text(viewModel.studentInfo?.studentName ?? "홍길동")
                        .JOBISFont(.heading(.heading6), color: .Sub.gray90)

                    Text((viewModel.studentInfo?.department ?? .softwareDevelop).localizedString())
                        .JOBISFont(.body(.body2), color: .Sub.gray90)

                    Text(viewModel.studentInfo?.studentGcn ?? "2학년 2반 18번")
                        .JOBISFont(.body(.body4), color: .Sub.gray70)
                        .padding(.bottom, 15)
                }
                .redacted(reason: viewModel.isLoading ? .placeholder : [])

                Text("백엔드")
                    .JOBISFont(.body(.body4), color: .Sub.gray10)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .background(Color.Main.lightBlue)
                    .cornerRadius(15)
                    .padding(.bottom, 35)

                VStack(alignment: .leading, spacing: 15) {
                    Divider().foregroundColor(.Sub.gray40)

                    myPageNavigateCell(title: "버그 제보하기", color: .Main.lightBlue) {
                        viewModel.isNavigateReportView.toggle()
                    }

                    Divider().foregroundColor(.Sub.gray40)

                    myPageNavigateCell(title: "관심분야 선택하기", color: .Main.lightBlue) {
                        viewModel.isNavigateReportView.toggle()
                    }

                    Divider().foregroundColor(.Sub.gray40)

                    myPageNavigateCell(title: "비밀번호 변경하기", color: .Main.lightBlue) {
                        viewModel.isNavigateReportView.toggle()
                    }

                    Divider().foregroundColor(.Sub.gray40)

                    myPageNavigateCell(title: "로그아웃", color: .State.error) {
                        viewModel.isPresentedLogoutAlert.toggle()
                    }

                    Divider().foregroundColor(.Sub.gray40)
                }
            }
            .padding(.horizontal, 25)
        }
        .navigate(
            to: reportFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateReportView
        )
        .onChange(of: viewModel.isTabbarHidden) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onChange(of: viewModel.isSuccessLogout) { newValue in
            if newValue {
                withAnimation {
                    appState.sceneFlow = .auth
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("마이페이지")
        .alert(isPresented: $viewModel.isPresentedLogoutAlert) {
            Alert(
                title: Text("로그아웃"),
                message: Text("정말로 로그아웃 하시겠습니까?"),
                primaryButton: Alert.Button.destructive(
                    Text("확인"),
                    action: {
                        viewModel.confirmLogoutButtonDidTap()
                    }
                ),
                secondaryButton: Alert.Button.cancel(
                    Text("취소")
                )
            )
        }
    }

    @ViewBuilder
    func myPageNavigateCell(
        title: String, color: Color, action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .JOBISFont(.etc(.caption), color: color)

                Spacer()
            }
        }
    }
}
