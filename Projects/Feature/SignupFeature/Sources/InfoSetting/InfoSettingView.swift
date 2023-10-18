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

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("개인정보 입력")
                .JOBISFont(.heading(.heading5), color: .Sub.gray90)
                .padding(.top, 20)

            Text("* 성별은 남성으로 고정됩니다. 추후에 마이페이지에서 수정해주세요.")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

//            VStack(alignment: .leading, spacing: 5) {
//                genderButton()
//
//                Text("* 위 정보는 취업 통계자료에 반영될 수 있습니다.")
//                    .JOBISFont(.etc(.caption), color: .Sub.gray70)
//                    .multilineTextAlignment(.leading)
//            }

            JOBISFormTextField(
                "이름을 입력하세요.",
                text: $viewModel.name
            ) {
                self.focusField = .grade
            }
            .focused($focusField, equals: .name)

            HStack {
                JOBISFormTextField(
                    "학년",
                    text: $viewModel.grade
                ) {
                    self.focusField = .classRoom
                }
                .focused($focusField, equals: .grade)
                .keyboardType(.numberPad)
                .filterNumericInput($viewModel.grade)

                JOBISFormTextField(
                    "반",
                    text: $viewModel.classRoom
                ) {
                    self.focusField = .number
                }
                .focused($focusField, equals: .classRoom)
                .keyboardType(.numberPad)
                .filterNumericInput($viewModel.classRoom)

                JOBISFormTextField(
                    "번호",
                    text: $viewModel.number
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

    @ViewBuilder
    func genderButton() -> some View {
        HStack(spacing: 20) {
            if viewModel.isMan {
                SolidBtn(
                    text: "남성",
                    size: .large
                ) {
                    viewModel.isMan.toggle()
                    focusField = .name
                }
            } else {
                ShadowBtn(
                    text: "남성",
                    size: .large
                ) {
                    viewModel.isMan.toggle()
                    focusField = .name
                }
            }

            if viewModel.isWoman {
                SolidBtn(
                    text: "여성",
                    size: .large
                ) {
                    viewModel.isWoman.toggle()
                    focusField = .name
                }
            } else {
                ShadowBtn(
                    text: "여성",
                    size: .large
                ) {
                    viewModel.isWoman.toggle()
                    focusField = .name
                }
            }
        }
    }
}
