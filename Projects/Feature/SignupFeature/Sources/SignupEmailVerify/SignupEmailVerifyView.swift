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

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("이메일 인증")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 20)

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
        }
    }
}
