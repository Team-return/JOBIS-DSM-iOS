import DesignSystem
import SwiftUI

struct ModifyPasswordView: View {
    private enum FocusField {
        case password
        case passwordCheck
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: ModifyPasswordViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode

    init(
        viewModel: ModifyPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            Text("변경할 비밀번호를 입력해주세요.")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.bottom, 26)

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
        }
        .hideKeyboardWhenTap()
        .padding(.horizontal, 20)
        .navigationTitle("비밀번호 재설정")
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
