import DesignSystem
import SwiftUI

struct SigninView: View {
    @StateObject var viewModel: SigninViewModel
    @Binding var isPresented: Bool
    @State private var email: String = ""
    @State private var password: String = ""
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
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0.0
                    )) {
                        self.isPresented.toggle()
                    }
                }
                VStack {
                    HStack {
                        Spacer()

                        SigninImage(.technyLaptop)
                            .frame(width: 199, height: 144)
                            .offset(x: 76, y: 30)
                            .matchedGeometryEffect(id: "TechnyLaptop", in: signinAnimation)
                    }
                    Spacer()
                        .frame(height: (proxy.size.height / 3) * 2)
                }

                authNavigation(height: (proxy.size.height / 3) * 2)
                    .matchedGeometryEffect(id: "AuthNavigation", in: signinAnimation)
            }
            .edgesIgnoringSafeArea(.all)
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
                        text: $email,
                        isError: viewModel.isErrorOcuured,
                        errorMessage: viewModel.errorMessage,
                        inputType: .none,
                        outlinedType: .bottomlined,
                        topMessage: "이메일") {
                            print("이메일")
                        }
                        .padding(.bottom, 45)
                    JOBISTextField(
                        placeholder: "최대 20자",
                        text: $password,
                        isError: viewModel.isErrorOcuured,
                        errorMessage: viewModel.errorMessage,
                        inputType: .password,
                        outlinedType: .bottomlined,
                        topMessage: "비밀번호") {
                            print("비밀번호")
                        }
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
                        print("로그인")
                    },
                    size: .large
                )
                .matchedGeometryEffect(id: "SigninButton", in: signinAnimation)
                .padding(.bottom, 45)
            }
            .frame(maxHeight: height)
            .background(Color.Sub.gray10)
            .cornerRadius(20, corners: [.topLeft, .topRight])
        }
    }
}
