import DesignSystem
import MyPageFeatureInterface
import SwiftUI
import UtilityModule

struct CheckPasswordView: View {
    private enum FocusField {
        case password
    }

    @Environment(\.rootPresentationMode) var rootPresentationMode
    @StateObject var viewModel: CheckPasswordViewModel
    @FocusState private var focusField: FocusField?

    private let modifyPasswordFactory: any ModifyPasswordFactory

    init(
        viewModel: CheckPasswordViewModel,
        modifyPasswordFactory: any ModifyPasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.modifyPasswordFactory = modifyPasswordFactory
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("기존 비밀번호를 입력해주세요.")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.bottom, 26)

            SecureJOBISFormTextField(
                "비밀번호를 입력해주세요.",
                text: $viewModel.password,
                isError: viewModel.isErrorOcuured,
                errorMessage: "비밀번호를 다시 확인해주세요."
            ) {
                viewModel.checkPasswordButtonDidTap()
            }
            .focused($focusField, equals: .password)
            .textContentType(.password)

            Spacer()

            SolidBtn(text: "다음", size: .large) {
                viewModel.checkPasswordButtonDidTap()
            }
        }
        .hideKeyboardWhenTap()
        .padding(.horizontal, 20)
        .navigationTitle("기존 비밀번호 확인")
        .navigate(
            to: modifyPasswordFactory.makeView(
                currentPassword: viewModel.password
            )
            .eraseToAnyView()
            .environment(\.rootPresentationMode, rootPresentationMode),
            when: $viewModel.isSuccessCheckPassword
        )
        .onAppear {
            focusField = .password
        }
    }
}
