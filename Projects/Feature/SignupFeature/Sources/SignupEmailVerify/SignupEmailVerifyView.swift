import DesignSystem
import StudentsDomainInterface
import SwiftUI
import BaseFeature
import Combine

struct SignupEmailVerifyView: View {
    private enum FocusField {
        case email
        case verifyCode
    }
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일 인증")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            inputTextfield()
        }
    }

    @ViewBuilder
    func inputTextfield() -> some View {
        VStack(spacing: 30) {
            JOBISTextField(
                placeholder: "이메일을 입력해주세요",
                text: $viewModel.email,
                outlinedType: .outlined,
                bottomMessage: "@dsm.hs.kr 이 포함되어야 합니다"
            ) {
                self.focusField = .verifyCode
            }
            .focused($focusField, equals: .email)
            .keyboardType(.emailAddress)

            HStack(spacing: 12) {
                ZStack {
                    JOBISTextField(
                        placeholder: "인증번호 6자리",
                        text: $viewModel.authCode,
                        outlinedType: .outlined
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
                    action: {
                        viewModel.sendAuthCode()
                    },
                    size: .small
                )
                .disabled(!viewModel.email.contains("@dsm.hs.kr"))
            }
        }
    }
}
