import DesignSystem
import StudentsDomainInterface
import SwiftUI
import BaseFeature

struct SignupPasswordView: View {
    private enum FocusField {
        case email
        case verifyCode
    }
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호 설정")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            inputTextfield()
        }
    }

    @ViewBuilder
    func inputTextfield() -> some View {
        VStack(spacing: 30) {
            JOBISTextField(
                placeholder: "비밀번호를 입력해주세요",
                text: $viewModel.password,
                isError: viewModel.isPasswordRegexError,
                errorMessage: "비밀번호 형식이 올바르지 않습니다.",
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
                isError: viewModel.isPasswordMismatchedError,
                errorMessage: "비밀번호가 일치하지 않습니다.",
                inputType: .password,
                outlinedType: .outlined
            ) {
                viewModel.nextButtonDidTap()
            }
            .focused($focusField, equals: .verifyCode)
            .textContentType(.newPassword)
        }
    }
}
