import DesignSystem
import SwiftUI
import BaseFeature

struct InfoSettingView: View {
    private enum FocusField {
        case name
        case grade
        case classRoom
        case number
    }
    @StateObject var viewModel: InfoSettingViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    private let signupEmailVerifyComponent: SignupEmailVerifyComponent

    init(
        viewModel: InfoSettingViewModel,
        signupEmailVerifyComponent: SignupEmailVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupEmailVerifyComponent = signupEmailVerifyComponent
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("개인정보 입력")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            genderButton()
                .padding(.bottom, 28)

            inputTextfield()

            Spacer()

            nextButton()
        }
        .padding(.horizontal, 26)
        .jobisBackButton(dismiss: dismiss, title: "회원가입")
        .navigate(
            to: signupEmailVerifyComponent.makeView(),
            when: $viewModel.isNavigateVerifyEmail
        )
    }

    @ViewBuilder
    func genderButton() -> some View {
        HStack(spacing: 20) {
            if viewModel.isMan {
                SolidBtn(
                    text: "남성",
                    action: {
                        viewModel.isMan.toggle()
                    },
                    size: .large
                )
            } else {
                ShadowBtn(
                    text: "남성",
                    action: {
                        viewModel.isMan.toggle()
                    },
                    size: .large
                )
            }

            if viewModel.isWoman {
                SolidBtn(
                    text: "여성",
                    action: {
                        viewModel.isWoman.toggle()
                    },
                    size: .large
                )
            } else {
                ShadowBtn(
                    text: "여성",
                    action: {
                        viewModel.isWoman.toggle()
                    },
                    size: .large
                )
            }
        }
    }

    @ViewBuilder
    func inputTextfield() -> some View {
        JOBISTextField(
            placeholder: "이름을 입력하세요",
            text: $viewModel.name,
            isError: viewModel.isErrorOcuured,
            errorMessage: "에러에러에러",
            outlinedType: .outlined
        ) {
            self.focusField = .grade
        }
        .focused($focusField, equals: .name)

        HStack {
            JOBISTextField(
                placeholder: "학년",
                text: $viewModel.grade,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                outlinedType: .outlined
            ) {
                self.focusField = .classRoom
            }
            .focused($focusField, equals: .grade)
            .keyboardType(.numberPad)
            .filterNumericInput($viewModel.grade)

            JOBISTextField(
                placeholder: "반",
                text: $viewModel.classRoom,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                outlinedType: .outlined
            ) {
                self.focusField = .number
            }
            .focused($focusField, equals: .classRoom)
            .keyboardType(.numberPad)
            .filterNumericInput($viewModel.classRoom)

            JOBISTextField(
                placeholder: "번호",
                text: $viewModel.number,
                isError: viewModel.isErrorOcuured,
                errorMessage: "에러에러에러",
                outlinedType: .outlined
            ) {
                viewModel.nextButtonDidTap()
            }
            .focused($focusField, equals: .number)
            .keyboardType(.numberPad)
            .filterNumericInput($viewModel.number)
        }
    }

    @ViewBuilder
    func nextButton() -> some View {
        VStack(spacing: 0) {
            VStack(alignment: .trailing, spacing: 4) {
                Text("0/3")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                ProgressView(value: 0)
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
