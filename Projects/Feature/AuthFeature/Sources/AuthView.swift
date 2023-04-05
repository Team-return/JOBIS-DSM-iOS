import DesignSystem
import SwiftUI
import SigninFeature
import SignupFeature

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel
    @State private var isAppear: Bool = false
    @Namespace var signinAnimation
    @Namespace var signupAnimation
    private let signinComponent: SigninComponent
    private let signupComponent: SignupComponent

    public init(
        viewModel: AuthViewModel,
        signinComponent: SigninComponent,
        signupComponent: SignupComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signinComponent = signinComponent
        self.signupComponent = signupComponent
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(gradient: Gradient(colors: [.Main.darkBlue, .Main.lightBlue, .Main.lightBlue]),
                           startPoint: .top, endPoint: .bottom)
            VStack {
                if !isAppear {
                    Spacer()
                }

                SigninImage(.splashIcon)
                    .frame(width: 145, height: 215)
                    .padding(.top, isAppear ? 100 : 0)
                    .animation(.spring(
                        response: 0.6,
                        dampingFraction: 0.5,
                        blendDuration: 0.0
                    ), value: isAppear)

                HStack {
                    SigninImage(.technyFeed)
                        .frame(width: 133, height: 196)
                        .offset(x: -16)
                    Spacer()
                    SigninImage(.technyLaptop)
                        .frame(width: 199, height: 144)
                        .offset(x: 76, y: 63)
                        .matchedGeometryEffect(id: "TechnyLaptop", in: signinAnimation)
                        .animation(.spring(
                            response: 0.6,
                            dampingFraction: 0.8,
                            blendDuration: 0.0
                        ), value: isAppear)
                }
                .opacity(isAppear ? 1 : 0)
                .animation(.spring(
                    response: 0.6,
                    dampingFraction: 0.5,
                    blendDuration: 0.0
                ), value: isAppear)

                Spacer()
            }

            authNavigation()
                .offset(y: isAppear ? 0 : 250)
                .animation(.spring(
                    response: 0.75,
                    dampingFraction: 0.8,
                    blendDuration: 0.0
                ), value: isAppear)
        }
        .edgesIgnoringSafeArea(.all)
        .overlay {
            if viewModel.isPresentedSignin {
                signinComponent.makeView(
                    signinAnimation: signinAnimation,
                    isPresented: $viewModel.isPresentedSignin
                )
            } else {
                EmptyView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.isAppear = true
            }
        }
    }
    @ViewBuilder
    func authNavigation() -> some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()

                Text("로그인하고 서비스를 사용하세요.")
                    .JOBISFont(.body(.body4), color: .Sub.gray70)
                    .padding(.top, 30)

                Spacer()
            }

            SolidBtn(
                text: "로그인",
                action: {
                    withAnimation {
                        viewModel.isPresentedSignin.toggle()
                    }
                },
                size: .large
            )
            .matchedGeometryEffect(id: "SigninButton", in: signinAnimation)

            GhostBtn(
                text: "회원가입",
                action: {
                    print("회원가입")
                },
                size: .large
            )
            .padding(.bottom, 70)
        }
        .background(
            Rectangle()
                .fill(Color.Sub.gray10)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .matchedGeometryEffect(id: "AuthNavigation", in: signinAnimation)
        )
    }
}
