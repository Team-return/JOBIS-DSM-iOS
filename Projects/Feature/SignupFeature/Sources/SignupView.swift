import DesignSystem
import SwiftUI
import BaseFeature

struct SignupView: View {
    private enum FocusField {
        case email
        case authCode
        case password
        case checkPassword
        case name
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?
    @Binding var isPresented: Bool
    var signupAnimation: Namespace.ID

    init(
        isPresented: Binding<Bool>,
        viewModel: SignupViewModel,
        signupAnimation: Namespace.ID
    ) {
        _isPresented = isPresented
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupAnimation = signupAnimation
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
                        if focusField == nil {
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
                            .matchedGeometryEffect(id: "TechnyLaptop", in: signupAnimation)
                            .animation(.spring(
                                response: 0.75,
                                dampingFraction: 0.7,
                                blendDuration: 0.0
                            ), value: isPresented)
                            .padding(.top, (proxy.size.height) * 0.05)
                    }
                    Spacer()
                }
                
                authNavigation(proxy: proxy)
            }
            .edgesIgnoringSafeArea(.all)
            .jobisToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        }
        .hideKeyboardWhenTap()
        .onChange(of: viewModel.isSuccessSignup) { _ in
            self.isPresented.toggle()
        }
    }
    
    // swiftlint:disable function_body_length
    @ViewBuilder
    func authNavigation(proxy: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("welcome")
                    .JOBISFont(.etc(.authSubTitle), color: .Sub.gray50)
                    .offset(x: 2)
                Text("Sign In")
                    .JOBISFont(.etc(.authTitle), color: .Sub.gray10)
            }
            .padding(.leading, 30)
            VStack {
                VStack {
                    ScrollView {
                        VStack(spacing: 40) {
                            JOBISTextField(
                                placeholder: "@dsm.hs.kr이 포함되어야합니다.",
                                text: $viewModel.email,
                                isError: viewModel.isErrorOcuured,
                                errorMessage: viewModel.errorMessage,
                                inputType: .none,
                                outlinedType: .bottomlined,
                                topMessage: "이메일") {
                                    focusField = .authCode
                                }
                                .padding(.top, 60)
                                .focused($focusField, equals: .email)
                                .textContentType(.emailAddress)

                            JOBISTextField(
                                placeholder: "최대 20자",
                                text: $viewModel.authCode,
                                isError: viewModel.isErrorOcuured,
                                errorMessage: viewModel.errorMessage,
                                inputType: .password,
                                outlinedType: .bottomlined,
                                topMessage: "인증번호") {
                                    focusField = .password
                                }
                                .focused($focusField, equals: .authCode)
                                .textContentType(.telephoneNumber)

                            JOBISTextField(
                                placeholder: "최대 20자",
                                text: $viewModel.password,
                                isError: viewModel.isErrorOcuured,
                                errorMessage: viewModel.errorMessage,
                                inputType: .password,
                                outlinedType: .bottomlined,
                                topMessage: "비밀번호") {
                                    focusField = .checkPassword
                                }
                                .focused($focusField, equals: .password)
                                .textContentType(.password)

                            JOBISTextField(
                                placeholder: "최대 20자",
                                text: $viewModel.password,
                                isError: viewModel.isErrorOcuured,
                                errorMessage: viewModel.errorMessage,
                                inputType: .password,
                                outlinedType: .bottomlined,
                                topMessage: "비밀번호 확인") {
                                    focusField = .name
                                }
                                .focused($focusField, equals: .checkPassword)
                                .textContentType(.password)

                            JOBISTextField(
                                placeholder: "최대 20자",
                                text: $viewModel.name,
                                isError: viewModel.isErrorOcuured,
                                errorMessage: viewModel.errorMessage,
                                inputType: .password,
                                outlinedType: .bottomlined,
                                topMessage: "이름") {
                                    focusField = .none
                                }
                                .focused($focusField, equals: .name)
                                .textContentType(.name)

                            HStack {
                                JOBISDropDown(
                                    selectedValue: $viewModel.grade,
                                    title: "학년",
                                    selections: [
                                        "1", "2", "3"
                                    ],
                                    width: proxy.size.width / 4
                                )
                                .zIndex(10)

                                JOBISDropDown(
                                    selectedValue: $viewModel.classRoom,
                                    title: "반",
                                    selections: [
                                        "1", "2", "3", "4"
                                    ],
                                    width: proxy.size.width / 4
                                )
                                .zIndex(10)

                                JOBISDropDown(
                                    selectedValue: $viewModel.number,
                                    title: "번호",
                                    selections: [
                                        "1", "2", "3", "4",
                                        "5", "6", "7", "8",
                                        "9", "10", "11", "12",
                                        "13", "14", "15", "16",
                                        "17", "18"
                                    ],
                                    width: proxy.size.width / 4
                                )
                                .zIndex(10)
                            }
                        }
                    }
                    .padding(.horizontal, 40)

                    GhostBtn(
                        text: "회원가입",
                        action: {
                            viewModel.signupButtonDidTap()
                        },
                        size: .large
                    )
                    .matchedGeometryEffect(id: "SignupButton", in: signupAnimation)
                    .padding(.bottom, 45)
                }
            }
            .jobisToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
            .frame(maxHeight: isPresented ? (proxy.size.height) * 0.95 : 0)
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
                    .matchedGeometryEffect(id: "AuthNavigation", in: signupAnimation)
            )
        }
    }
}
