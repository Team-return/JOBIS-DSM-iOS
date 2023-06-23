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
        VStack(alignment: .leading) {
            Text("비밀번호 설정")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            Text("비밀번호는 영문, 숫자, 기호를 포함한 8~16자이어야 합니다.")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)

            VStack(spacing: 30) {
                SecureJOBISFormTextField(
                    "비밀번호를 입력해주세요.",
                    text: $viewModel.password,
                    isError: viewModel.isPasswordRegexError,
                    errorMessage: "비밀번호 형식이 올바르지 않습니다."
                ) {
                    self.focusField = .checkPassword
                }
                .focused($focusField, equals: .password)
                .textContentType(.password)

                SecureJOBISFormTextField(
                    "비밀번호를 다시 입력해주세요.",
                    text: $viewModel.checkPassword,
                    isError: viewModel.isPasswordMismatchedError,
                    errorMessage: "비밀번호가 일치하지 않습니다."
                ) {
                    self.focusField = .checkPassword
                }
                .focused($focusField, equals: .checkPassword)
                .textContentType(.newPassword)
            }
        }
    }
}
