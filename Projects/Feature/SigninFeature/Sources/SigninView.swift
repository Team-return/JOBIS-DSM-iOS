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
    @Binding var isPresented: Bool
    var signinAnimation: Namespace.ID

    init(
        isPresented: Binding<Bool>,
        viewModel: SigninViewModel,
        signinAnimation: Namespace.ID
    ) {
        _isPresented = isPresented
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signinAnimation = signinAnimation
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                LinearGradient(
                    gradient: Gradient(colors: [.Main.darkBlue, .Main.lightBlue, .Main.lightBlue]),
                    startPoint: .top, endPoint: .bottom
                )
                .onTapGesture {
                    withAnimation(.spring(
                        response: 0.6,
                        dampingFraction: 0.7,
                        blendDuration: 0.0
                    )) {
                        if !(focusField == .id || focusField == .password) {
                            self.isPresented.toggle()
                        }
                    }
                }
                .hideKeyboardWhenTap()
                VStack {
                    HStack {
                        Spacer()

                        SigninImage(.technyLaptop)
                            .frame(width: 199, height: 144)
                            .offset(x: 76, y: 30)
                            .matchedGeometryEffect(id: "TechnyLaptop", in: signinAnimation)
                            .animation(.spring(
                                response: 0.75,
                                dampingFraction: 0.7,
                                blendDuration: 0.0
                            ), value: isPresented)
                    }
                    Spacer()
                        .frame(height: (proxy.size.height / 4) * 3)
                }

                authNavigation(height: (proxy.size.height / 4) * 3)
            }
            .edgesIgnoringSafeArea(.all)
            .jobisToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        }
        .hideKeyboardWhenTap()
        .onChange(of: viewModel.isSuccessSignin) { newValue in
            guard newValue else { return }
            appState.sceneFlow = .main
        }
    }

    // swiftlint:disable function_body_length
    @ViewBuilder
    func authNavigation(height: CGFloat) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("welcome")
                    .JOBISFont(.etc(.authSubTitle), color: .Sub.gray50)
                    .offset(x: 2)
                Text("Sign In")
                    .JOBISFont(.etc(.authTitle), color: .Sub.gray10)
            }
            .padding(.leading, 30)
            VStack(spacing: 15) {
                VStack {
                    JOBISTextField(
                        placeholder: "@dsm.hs.kr이 포함되어야합니다.",
                        text: $viewModel.email,
                        isError: viewModel.isErrorOcuured,
                        errorMessage: viewModel.errorMessage,
                        inputType: .none,
                        outlinedType: .bottomlined,
                        topMessage: "이메일") {
                            focusField = .password
                        }
                        .focused($focusField, equals: .id)
                        .textContentType(.emailAddress)
                        .padding(.bottom, 45)
                    JOBISTextField(
                        placeholder: "최대 20자",
                        text: $viewModel.password,
                        isError: viewModel.isErrorOcuured,
                        errorMessage: viewModel.errorMessage,
                        inputType: .password,
                        outlinedType: .bottomlined,
                        topMessage: "비밀번호") {
                            viewModel.signinButtonDidTap()
                        }
                        .focused($focusField, equals: .password)
                        .textContentType(.password)
                }
                .padding(.horizontal, 40)
                .padding(.top, 60)
                Spacer()
                Text("비밀번호를 잊으셨나요?")
                    .JOBISFont(.body(.body4), color: .Sub.gray70)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.Sub.gray70),
                        alignment: .bottom
                    )
                    .padding(.bottom, 15)
                SolidBtn(
                    text: "로그인",
                    action: {
                        viewModel.signinButtonDidTap()
                    },
                    size: .large
                )
                .matchedGeometryEffect(id: "SigninButton", in: signinAnimation)
                .padding(.bottom, 45)
            }
            .frame(maxHeight: isPresented ? height : 0)
            .background(
                Rectangle()
                    .fill(Color.Sub.gray10)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .animation(.spring(
                        response: 0.75,
                        dampingFraction: 0.8,
                        blendDuration: 0.0),
                               value: isPresented
                    )
                    .matchedGeometryEffect(id: "AuthNavigation", in: signinAnimation)
            )
        }
    }
}
