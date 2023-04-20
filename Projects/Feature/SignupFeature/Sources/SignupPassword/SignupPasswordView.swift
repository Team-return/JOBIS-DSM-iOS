import DesignSystem
import SwiftUI
import BaseFeature

struct SignupPasswordView: View {
    private enum FocusField {
        case email
        case verifyCode
    }
    @StateObject var viewModel: SignupPasswordViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호 설정")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            inputTextfield()

            Spacer()

            nextButton()
        }
        .padding(.horizontal, 26)
        .jobisBackButton(dismiss: dismiss, title: "회원가입")
    }

    @ViewBuilder
    func inputTextfield() -> some View {
        VStack(spacing: 30) {
            JOBISTextField(
                placeholder: "비밀번호를 입력해주세요",
                text: $viewModel.password,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                inputType: .password,
                outlinedType: .outlined,
                bottomMessage: "8 ~ 16자, 영문자, 숫자, 특수문자 포함"
            ) {
                self.focusField = .verifyCode
            }
            .focused($focusField, equals: .email)
            .textContentType(.password)

            JOBISTextField(
                placeholder: "비밀번호를 다시 입력해주세요",
                text: $viewModel.checkPassword,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                inputType: .password,
                outlinedType: .outlined
            ) {
                viewModel.nextButtonDidTap()
            }
            .focused($focusField, equals: .verifyCode)
            .textContentType(.newPassword)
        }
    }

    @ViewBuilder
    func nextButton() -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .trailing, spacing: 4) {
                Text("2/3")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                ProgressView(value: Double(2)/3)
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
