import DesignSystem
import SwiftUI
import BaseFeature
import StudentsDomainInterface

struct InfoSettingView: View {
    private enum FocusField {
        case name
        case grade
        case classRoom
        case number
    }
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

    var body: some View {
        VStack(alignment: .leading) {
            Text("개인정보 입력")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.vertical, 32)

            genderButton()
                .padding(.bottom, 28)

            inputTextfield()
        }
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
            outlinedType: .outlined
        ) {
            self.focusField = .grade
        }
        .focused($focusField, equals: .name)

        HStack {
            JOBISTextField(
                placeholder: "학년",
                text: $viewModel.grade,
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
                outlinedType: .outlined
            ) {
                if viewModel.isButtonEnabled {
                    focusField = .none
                } else {
                    viewModel.nextButtonDidTap()
                }
            }
            .focused($focusField, equals: .number)
            .keyboardType(.numberPad)
            .filterNumericInput($viewModel.number)
        }
    }
}
