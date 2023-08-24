import DesignSystem
import BugFeatureInterface
import MyPageFeatureInterface
import PostReviewFeatureInterface
import CompaniesDomainInterface
import SwiftUI
import UtilityModule
import Kingfisher
import BaseFeature

struct MyPageView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: MyPageViewModel

    private let reportFactory: any ReportFactory
    private let bugListFactory: any BugListFactory
    private let checkPasswordFactory: any CheckPasswordFactory
    private let postReviewFactory: any PostReviewFactory

    init(
        viewModel: MyPageViewModel,
        reportFactory: any ReportFactory,
        bugListFactory: any BugListFactory,
        checkPasswordFactory: any CheckPasswordFactory,
        postReviewFactory: any PostReviewFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.reportFactory = reportFactory
        self.bugListFactory = bugListFactory
        self.checkPasswordFactory = checkPasswordFactory
        self.postReviewFactory = postReviewFactory
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                HStack(spacing: 22) {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Group {
                                if let profileImage = viewModel.image {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } else {
                                    URLImage(
                                        imageURL: viewModel.studentInfo?.profileImageUrl ?? "",
                                        size: 85
                                    )
                                }
                            }
                            .frame(width: 85, height: 85)
                            .clipShape(Circle())

                            Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(.Main.lightBlue)
                                .background(Color.white)
                                .clipShape(Circle())
                                .unredacted()
                        }
                    }
                    .onTapGesture {
                        viewModel.isShowImagePicker.toggle()
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text(viewModel.studentInfo?.studentName ?? "Loading")
                            .JOBISFont(.heading(.heading6), color: .Sub.gray90)

                        Text((viewModel.studentInfo?.department ?? .none).localizedString())
                            .JOBISFont(.body(.body2), color: .Sub.gray90)

                        Text(viewModel.studentInfo?.studentGcn ?? "")
                            .JOBISFont(.body(.body4), color: .Sub.gray70)
                    }

                    Spacer()
                }
                .padding(.top, 40)

                if let writableReviewList = viewModel.writableReviewList?.companies {
                    if !writableReviewList.isEmpty {
                        VStack(spacing: 10) {
                            ForEach(writableReviewList, id: \.self) { company in
                                writableReviewCell(company: company)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 15) {
                    Divider().foregroundColor(.Sub.gray40)

                    myPageNavigateCell(title: "버그 제보하기", color: .Main.lightBlue) {
                        viewModel.isNavigateReportView.toggle()
                    }

                    Divider().foregroundColor(.Sub.gray40)

                    if appState.authority == .developer {
                        myPageNavigateCell(title: "버그함", color: .Main.lightBlue) {
                            viewModel.isNavigateBugListView.toggle()
                        }

                        Divider().foregroundColor(.Sub.gray40)
                    }

                    myPageNavigateCell(title: "비밀번호 변경하기", color: .Main.lightBlue) {
                        viewModel.isNavigateChangePassword.toggle()
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
        .navigate(
            to: bugListFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateBugListView
        )
        .navigate(
            to: checkPasswordFactory.makeView().eraseToAnyView()
                .environment(\.rootPresentationMode, $viewModel.isNavigateChangePassword),
            when: $viewModel.isNavigateChangePassword
        )
        .imagePicker(isShow: $viewModel.isShowImagePicker, uiImage: $viewModel.image)
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
        .onChange(of: viewModel.image) { _ in
            viewModel.changeProfileImageDidSelected()
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

    @ViewBuilder
    func writableReviewCell(company: WritableReviewCompanyEntity) -> some View {
        Button {
            viewModel.isNavigatePostReview.toggle()
        } label: {
            HStack(spacing: 5) {
                Text(company.name)
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                Text("면접후기 작성하기")
                    .JOBISFont(.etc(.caption), color: .Main.lightBlue)
            }
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(Color.Sub.gray10)
            .cornerRadius(15)
            .shadow(opacity: 0.1, blur: 4)
        }
        .navigate(
            to: postReviewFactory.makeView(companyID: company.id).eraseToAnyView(),
            when: $viewModel.isNavigatePostReview
        )
    }
}
