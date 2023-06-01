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
            isShowing: $viewModel.isShowSuccessVerifyEmailToast,
            message: "다음을 눌러 계속 진행하세요.",
            style: .success,
            title: "인증완료!"
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
}
