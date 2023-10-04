import SwiftUI

struct JOBISToast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let style: JOBISToastStyle
    let title: String?

    init(
        isShowing: Binding<Bool>,
        message: String,
        style: JOBISToastStyle,
        title: String? = nil
    ) {
        _isShowing = isShowing
        self.message = message
        self.style = style
        self.title = title
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            jobisToastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func jobisToastView() -> some View {
        VStack {
            if isShowing {
                HStack(alignment: .center, spacing: 18) {
                    style.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(style.textForeground)
                        .frame(width: style.size.width, height: style.size.height)

                    VStack(alignment: .leading, spacing: 0) {
                        if let title {
                            Text(title)
                                .JOBISFont(.body(.body3), color: style.textForeground)
                        }

                        Text(message)
                            .JOBISFont(.body(.body4), color: .Sub.gray70)
                    }
                    Spacer()
                    DesignSystemAsset.Icons.close.swiftUIImage
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .transition(.offset(y: -50).combined(with: AnyTransition.opacity.animation(.default)))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
                .background {
                    Rectangle()
                        .fill(Color.Sub.gray10)
                        .cornerRadius(20)
                        .shadow(color: .Sub.gray50, radius: 5)
                }
                .padding(.horizontal, 12)
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            }

            Spacer()
        }
        .animation(.default, value: isShowing)
    }
}

public extension View {
    func jobisToast(
        isShowing: Binding<Bool>,
        message: String,
        style: JOBISToastStyle,
        title: String? = nil
    ) -> some View {
        modifier(JOBISToast(isShowing: isShowing, message: message, style: style, title: title))
    }
}

struct JOBISToast_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            NavigationLink {
                Text("nav")
                    .jobisToast(isShowing: .constant(true), message: "안녕하세요", style: .error, title: "hello")
                    .jobisBackButton {}
            } label: {
                Text("hello")
            }
        })
    }
}
