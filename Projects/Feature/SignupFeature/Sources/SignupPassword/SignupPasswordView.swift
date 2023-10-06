import DesignSystem
import StudentsDomainInterface
import SwiftUI
import BaseFeature

struct SignupPasswordView: View {
    private enum FocusField {
        case password
        case checkPassword
    }
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("비밀번호 설정")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 20)

            VStack(alignment: .leading, spacing: 1) {
                SecureJOBISFormTextField(
                    "비밀번호를 입력해주세요.",
                    text: $viewModel.password,
                    isError: viewModel.isPasswordRegexError,
                    errorMessage: "비밀번호 형식이 올바르지 않습니다."
                ) {
                    focusField = .checkPassword
                }
                .focused($focusField, equals: .password)
                .textContentType(.password)

                Text("8 ~ 16자, 영문자, 숫자, 특수문자 포함")
                    .JOBISFont(.body(.body4), color: .Sub.gray60)
            }

            SecureJOBISFormTextField(
                "비밀번호를 다시 입력해주세요.",
                text: $viewModel.checkPassword,
                isError: viewModel.isPasswordMismatchedError,
                errorMessage: "비밀번호가 일치하지 않습니다."
            ) {
                viewModel.nextButtonDidTap()
            }
            .focused($focusField, equals: .checkPassword)
            .textContentType(.newPassword)
        }
    }
}
