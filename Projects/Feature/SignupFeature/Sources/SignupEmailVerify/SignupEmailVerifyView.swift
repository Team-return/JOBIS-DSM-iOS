import DesignSystem
import SwiftUI
import BaseFeature
import Combine

struct SignupEmailVerifyView: View {
    private enum FocusField {
        case email
        case verifyCode
    }
    @StateObject var viewModel: SignupEmailVerifyViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    let signupPasswordComponent: SignupPasswordComponent

    init(
        viewModel: SignupEmailVerifyViewModel,
        signupPasswordComponent: SignupPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupPasswordComponent = signupPasswordComponent
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일 인증")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            inputTextfield()

            Spacer()

            nextButton()
        }
        .padding(.horizontal, 26)
        .jobisBackButton(dismiss: dismiss, title: "회원가입")
        .navigate(
            to: signupPasswordComponent.makeView(),
            when: $viewModel.isNavigateSignupPassword
        )
    }

    @ViewBuilder
    func inputTextfield() -> some View {
        VStack(spacing: 30) {
            JOBISTextField(
                placeholder: "이메일을 입력해주세요",
                text: $viewModel.email,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                outlinedType: .outlined,
                bottomMessage: "@dsm.hs.kr 이 포함되어야 합니다"
            ) {
                self.focusField = .verifyCode
            }
            .focused($focusField, equals: .email)
            .keyboardType(.emailAddress)

            HStack(spacing: 12) {
                JOBISTextField(
                    placeholder: "인증번호 6자리",
                    text: $viewModel.verifyCode,
                    isError: viewModel.isErrorOcuured,
                    errorMessage: "에러에러에러",
                    outlinedType: .outlined
                ) {
                    viewModel.nextButtonDidTap()
                }
                .focused($focusField, equals: .verifyCode)
                .keyboardType(.numberPad)
                .filterNumericInput($viewModel.verifyCode)
                .onReceive(Just(viewModel.verifyCode)) { _ in
                    if 6 < viewModel.verifyCode.count {
                        viewModel.verifyCode = String(viewModel.verifyCode.prefix(6))
                    }
                }

                SolidBtn(
                    text: "인증번호",
                    action: {},
                    size: .small
                )
            }
        }
    }

    @ViewBuilder
    func nextButton() -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .trailing, spacing: 4) {
                Text("1/3")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                ProgressView(value: Double(1)/3)
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
