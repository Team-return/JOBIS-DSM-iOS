import DesignSystem
import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel
    @State private var isAppear: Bool = false

    init(
        viewModel: AuthViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
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

                HStack {
                    SigninImage(.technyFeed)
                        .frame(width: 133, height: 196)
                        .offset(x: -16)
                    Spacer()
                    SigninImage(.technyLaptop)
                        .frame(width: 199, height: 144)
                        .offset(x: 76, y: 63)
                }
                .opacity(isAppear ? 1 : 0)

                Spacer()
            }

            authNavigation()
                .offset(y: isAppear ? 0 : 250)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                withAnimation(
                    .spring(
                        response: 0.6,
                        dampingFraction: 0.5,
                        blendDuration: 0.0
                    )
                ) {
                    self.isAppear = true
                }
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

                },
                size: .large
            )

            GhostBtn(
                text: "회원가입",
                action: {

                },
                size: .large
            )
            .padding(.bottom, 70)
        }
        .background(Color.Sub.gray10)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}
