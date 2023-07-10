import DesignSystem
import Combine
import SwiftUI
import UtilityModule

struct RenewalPasswordView: View {
    @Environment(\.dismiss) var dismiss
    private enum FocusField {
        case password
        case passwordCheck
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: RenewalPasswordViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode

    init(
        viewModel: RenewalPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("비밀번호 변경")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.top, 45)

            Text("8 ~ 16자, 영문자, 숫자, 특수문자 포함")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.bottom, 35)

            SecureJOBISFormTextField(
                "새 비밀번호 입력",
                text: $viewModel.password,
                isError: viewModel.isPasswordRegexError,
                errorMessage: "비밀번호가 형식이 올바르지 않습니다."
            ) {
                focusField = .passwordCheck
            }
            .focused($focusField, equals: .password)
            .textContentType(.password)
            .padding(.bottom, 25)

            SecureJOBISFormTextField(
                "새 비밀번호 확인",
                text: $viewModel.passwordCheck,
                isError: viewModel.isPasswordMismatchedError,
                errorMessage: "비밀번호가 위와 일치하지 않습니다."
            ) {
                viewModel.changePasswordButtonDidTap()
            }
            .focused($focusField, equals: .passwordCheck)

            Spacer()

            SolidBtn(text: "다음", size: .large) {
                viewModel.changePasswordButtonDidTap()
            }
            .padding(.vertical, 20)
        }
        .hideKeyboardWhenTap()
        .padding(.horizontal, 20)
        .jobisBackButton(title: "비밀번호 재설정") {
            dismiss()
        }
        .jobisToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .jobisToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .alert(isPresented: $viewModel.isTappedChangePassword) {
            Alert(
                title: Text("비밀번호 변경"),
                message: Text("정말로 비밀번호를 변경하시겠습니까??"),
                primaryButton: Alert.Button.destructive(
                    Text("확인"),
                    action: {
                        viewModel.changePassword()
                    }
                ),
                secondaryButton: Alert.Button.cancel(
                    Text("취소")
                )
            )
        }
        .onAppear {
            focusField = .password
        }
        .onChange(of: viewModel.isSuccessRenewalPassword) { newValue in
            if newValue {
                rootPresentationMode.wrappedValue.dismiss()
            }
        }
    }
}
