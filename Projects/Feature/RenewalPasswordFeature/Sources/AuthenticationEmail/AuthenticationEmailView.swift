import DesignSystem
import SwiftUI
import Combine
import RenewalPasswordFeatureInterface
import UtilityModule

struct AuthenticationEmailView: View {
    @Environment(\.dismiss) var dismiss
    private enum FocusField {
        case email
        case verifyCode
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: AuthenticationEmailViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode

    private let renewalPasswordFactory: any RenewalPasswordFactory

    init(
        viewModel: AuthenticationEmailViewModel,
        renewalPasswordFactory: any RenewalPasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.renewalPasswordFactory = renewalPasswordFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("이메일 인증")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 45)

            JOBISFormTextField(
                "이메일을 입력해주세요.",
                text: $viewModel.email
            ) {
                self.focusField = .verifyCode
            }
            .focused($focusField, equals: .email)
            .keyboardType(.emailAddress)
            .padding(.bottom, 4)

            Text("@dsm.hs.kr 이 포함되어야 합니다.")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.bottom, 12)

            HStack(spacing: 12) {
                ZStack {
                    JOBISFormTextField(
                        "인증번호 6자리",
                        text: $viewModel.authCode
                    ) {
                        focusField = .none
                    }
                    .focused($focusField, equals: .verifyCode)
                    .keyboardType(.default)
                    .onReceive(Just(viewModel.authCode)) { _ in
                        if 6 < viewModel.authCode.count {
                            viewModel.authCode = String(viewModel.authCode.prefix(6))
                        }
                    }

                    HStack {
                        Spacer()
                        Text(viewModel.timeText)
                            .padding(.trailing, 12)
                            .JOBISFont(.body(.body4), color: .State.message)
                    }
                }

                SolidBtn(
                    text: viewModel.sendEmailButtonTitle,
                    size: .small
                ) {
                    viewModel.sendAuthCode()
                }
                .disabled(!viewModel.email.contains("@dsm.hs.kr"))
            }

            Spacer()

            SolidBtn(
                text: "인증 확인",
                size: .large
            ) {
                viewModel.emailVerifyNextButtonDidTap()
            }
            .disabled(
                !viewModel.isEmailSend
            )
            .padding(.vertical, 20)
        }
        .hideKeyboardWhenTap()
        .padding(.horizontal, 20)
        .navigate(
            to: renewalPasswordFactory.makeView(email: viewModel.email)
                .eraseToAnyView()
                .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isNavigateRenewalPassword
        )
        .jobisBackButton(title: "비밀번호 재설정") {
            dismiss()
        }
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
    }
}
