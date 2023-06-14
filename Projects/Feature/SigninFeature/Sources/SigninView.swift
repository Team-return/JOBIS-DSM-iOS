import DesignSystem
import SwiftUI
import BaseFeature
import SignupFeatureInterface

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?
    @State var isNavigateSignup = false
    @State private var isOnAppear = false

    private let signupFactory: any SignupFactory

    init(
        viewModel: SigninViewModel,
        signupFactory: any SignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupFactory = signupFactory
    }

    var body: some View {
        NavigationView {
            ZStack {
                designRectangle()

                VStack(spacing: 0) {
                    Spacer()

                    HStack {
                        VStack {
                            Text("취업의 지름길")
                                .JOBISFont(.etc(.caption), color: .Sub.gray70)
                                .offset(x: -10, y: 10)

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
            .ignoresSafeArea(edges: .top)
            .jobisToast(isShowing: $viewModel.isShowToast, message: viewModel.errorMessage, style: .error)
            .jobisBackground()
            .hideKeyboardWhenTap()
            .onChange(of: viewModel.isSuccessSignin) { newValue in
                guard newValue else { return }
                appState.sceneFlow = .main
            }
            .navigate(
                to: signupFactory.makeView().eraseToAnyView(),
                when: $isNavigateSignup
            )
            .onAppear {
                withAnimation(.spring()) {
                    self.isOnAppear = true
                }
            }
            .environment(\.rootPresentationMode, $isNavigateSignup)
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
            .offset(x: 100, y: isOnAppear ? -240 : -1000)
            .shadow(blur: 20)

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
            .keyboardType(.emailAddress)
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

                Button {
                    isNavigateSignup.toggle()
                } label: {
                    Text("회원가입")
                        .JOBISFont(.etc(.caption), color: .Sub.gray90)
                        .underline()
                }

                Spacer()
            }

            SolidBtn(
                text: "로그인",
                size: .large
            ) {
                viewModel.signinButtonDidTap()
            }
            .padding(.vertical, 20)
        }
    }
}
