import DesignSystem
import SwiftUI
import BaseFeature

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?

    init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            Color.Sub.gray10
                .ignoresSafeArea()

            designRectangle()

            VStack(spacing: 0) {
                Spacer()

                HStack {
                    VStack {
                        Text("취업의 지름길")
                            .JOBISFont(.etc(.caption), color: .Sub.gray70)
                            .offset(x: -9, y: 5)

                        Text("JOBIS")
                            .JOBISFont(.heading(.heading1), color: .Main.lightBlue)
                    }
                    Spacer()
                }

                Spacer()

                signinInput()

                Spacer()
                Spacer()

                signinButton()
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea(.keyboard)
        .jobisToast(isShowing: $viewModel.isShowToast, message: viewModel.errorMessage, style: .error)
        .hideKeyboardWhenTap()
        .onChange(of: viewModel.isSuccessSignin) { newValue in
            guard newValue else { return }
            appState.sceneFlow = .main
        }
    }

    @ViewBuilder
    func designRectangle() -> some View {
        VStack(alignment: .trailing) {
            LinearGradient(
                gradient: Gradient(colors: [.Main.blue, .Main.blue, .Main.lightBlue]),
                startPoint: .trailing, endPoint: .leading
            )
            .frame(width: 320, height: 320)
            .cornerRadius(10)
            .rotationEffect(.degrees(-45))
            .offset(x: 100, y: -240)
            .shadow(radius: 10)

            Spacer()
        }
    }

    @ViewBuilder
    func signinInput() -> some View {
        VStack(spacing: 30) {
            JOBISTextField(
                placeholder: "이메일을 입력해주세요",
                text: $viewModel.email,
                isError: viewModel.isEmailError,
                errorMessage: viewModel.errorMessage,
                outlinedType: .outlined
            ) {
                focusField = .password
            }
            .textContentType(.username)
            .focused($focusField, equals: .id)

            JOBISTextField(
                placeholder: "비밀번호를 입력해주세요",
                text: $viewModel.password,
                isError: viewModel.isPasswordError,
                errorMessage: viewModel.errorMessage,
                inputType: .password,
                outlinedType: .outlined
            ) {
                viewModel.signinButtonDidTap()
            }
            .textContentType(.password)
            .focused($focusField, equals: .password)

            HStack(spacing: 8) {
                JOBISCheckBox(isOn: $viewModel.isAutoSignin)

                Text("자동로그인")
                    .JOBISFont(.etc(.caption), color: .Sub.gray90)
                    .onTapGesture {
                        withAnimation {
                            viewModel.isAutoSignin.toggle()
                        }
                    }

                Spacer()

                Text("비밀번호 재설정")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
    }

    @ViewBuilder
    func signinButton() -> some View {
        VStack {
            HStack {
                Spacer()

                Text("아직 회원이 아니신가요? ")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                Text("회원가입")
                    .JOBISFont(.etc(.caption), color: .Sub.gray90)
                    .underline()

                Spacer()
            }

            SolidBtn(
                text: "로그인",
                action: {
                    viewModel.signinButtonDidTap()
                },
                size: .large
            )
            .padding(.vertical, 20)
        }
    }
}
