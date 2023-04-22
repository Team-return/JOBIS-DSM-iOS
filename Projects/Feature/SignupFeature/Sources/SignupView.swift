import DesignSystem
import SwiftUI
import BaseFeature

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State var isShowToast = false

    var body: some View {
        VStack(alignment: .leading) {
            Button("hello") {
                isShowToast.toggle()
            }
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
        .navigationTitle("hi")
//        .jobisBackButton(title: "회원가입") {
//            viewModel.backButtonDidTap {
//                dismiss()
//            }
//        }
        .jobisToast(
            isShowing: $viewModel.isShowMessageToast,
            message: "인증번호 발송 완료",
            style: .message,
            title: "이메일을 확인해 주세요"
        )
        .jobisToast(
            isShowing: $viewModel.isShowErrorToast,
            message: viewModel.errorMessage,
            style: .error,
            title: "에러"
        )
        .jobisToast(
            isShowing: $isShowToast,
            message: "errorTestToast",
            style: .error
        )
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
                text: "다음",
                action: {
                    viewModel.nextButtonDidTap()
                },
                size: .large
            )
            .padding(.vertical, 20)
        }
    }
}
