import DesignSystem
import SwiftUI
import BaseFeature

struct SignupView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SignupViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            switch viewModel.signupType {
            case .infoSetting:
                InfoSettingView(viewModel: viewModel)

            case .emailVerify:
                SignupEmailVerifyView(viewModel: viewModel)

            case .password:
                SignupPasswordView(viewModel: viewModel)

            case .infoAgree:
                infoAgreeWebView(url: "https://jobis-webview.team-return.com/sign-up-policy")
            }

            Spacer()

            nextButton()
        }
        .padding(.horizontal, 26)
        .animation(.default, value: viewModel.progressValue)
        .jobisBackButton(title: "회원가입") {
            viewModel.backButtonDidTap {
                dismiss()
            }
        }
        .jobisToast(
            isShowing: $viewModel.isInfoSettingError,
            message: viewModel.errorMessage,
            style: .error,
            title: "에러"
        )
        .jobisToast(
            isShowing: $viewModel.isAuthCodeError,
            message: viewModel.errorMessage,
            style: .error,
            title: "에러"
        )
        .jobisToast(
            isShowing: $viewModel.isShowMessageToast,
            message: "인증번호 발송 완료",
            style: .message,
            title: "이메일을 확인해 주세요"
        )
        .jobisToast(
            isShowing: $viewModel.isShowEmailVerifyErrorToast,
            message: viewModel.errorMessage,
            style: .error,
            title: "에러"
        )
        .jobisToast(
            isShowing: $viewModel.isShowSignupErrorToast,
            message: "중복 계정",
            style: .error,
            title: "이미 계정이 존재합니다!"
        )
        .onChange(of: viewModel.isSuccessSignup) { newValue in
            guard newValue else { return }
            appState.sceneFlow = .main
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    @ViewBuilder
    func nextButton() -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .trailing, spacing: 4) {
                Text(String(viewModel.progressValue) + "/3")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                ProgressView(value: Double(viewModel.progressValue)/3)
                    .progressViewStyle(LinearProgressViewStyle(tint: .Main.lightBlue))
            }

            SolidBtn(
                text: viewModel.nextButtonTitle,
                size: .large
            ) {
                viewModel.nextButtonDidTap()
            }
            .disabled(
                viewModel.isButtonEnabled
            )
            .padding(.vertical, 20)
        }
    }

    @ViewBuilder
    func infoAgreeWebView(url: String) -> some View {
        VStack(alignment: .leading) {
            Text("약관 동의")
                .JOBISFont(.heading(.heading1), color: .Sub.gray90)
                .padding(.top, 24)

            JOBISWebView(urlToLoad: url)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    JOBISRadioBox(isOn: $viewModel.isAgreeTerms)

                    Text("전체 약관 동의")
                        .JOBISFont(.etc(.caption), color: .Sub.gray70)

                    Spacer()
                }
                .onTapGesture {
                    viewModel.isAgreeTerms.toggle()
                }
            }
        }
    }
}
