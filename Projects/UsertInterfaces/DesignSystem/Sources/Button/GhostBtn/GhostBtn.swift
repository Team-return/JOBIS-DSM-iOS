import SwiftUI

public struct GhostBtn: View {
    var text: String
    var style: BtnStyle
    var action: () -> Void
    var size: BtnSize
    var icon: Image
    var iconWidth: CGFloat
    var iconHeight: CGFloat

    public init(
        text: String = "",
        style: BtnStyle = .defaultStyle,
        color: Color = .Main.lightBlue,
        action: @escaping () -> Void = {},
        size: BtnSize = .medium,
        icon: Image = Image(systemName: "squareshape.fill"),
        iconWidth: CGFloat = 20,
        iconHeight: CGFloat = 20
    ) {
        self.text = text
        self.style = style
        self.action = action
        self.size = size
        self.icon = icon
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: size == .large ? 8 : 5) {
                if style == .lIcon { // L icon
                    icon
                        .frame(width: iconWidth, height: iconHeight)
                }
                if style != .icon1 && style != .icon2 { // default, L icon, R icon
                    Text(text)
                } else { // icon1 or icon2
                    icon
                        .resizable()
                        .frame(width: iconWidth, height: iconHeight)
                }
                if style == .rIcon { // R icon
                    icon
                        .resizable()
                        .frame(width: iconWidth, height: iconHeight)
                }
            }
        }
        .buttonStyle(GhostBtnStyle(style: style, size: size))
    }
}
// swiftlint:disable line_length

struct GhostBtn_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    GhostBtn(text: "버튼", style: .defaultStyle, size: .small)
                        .disabled(false)
                    GhostBtn(text: "버튼", style: .defaultStyle, size: .medium)
                    GhostBtn(text: "버튼", style: .defaultStyle, size: .large)
                }
                .padding(10)
                .background(.white)
                VStack {
                    GhostBtn(text: "버튼", style: .lIcon, size: .medium, icon: Image(systemName: "pencil"))
                    GhostBtn(text: "버튼", style: .lIcon, size: .large, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
                VStack {
                    GhostBtn(text: "버튼", style: .rIcon, size: .medium, icon: Image(systemName: "pencil"))
                    GhostBtn(text: "버튼", style: .rIcon, size: .large, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
                VStack {
                    GhostBtn(style: .icon1, icon: Image(systemName: "pencil"))
                }
                .padding(10)
                .background(.white)
                VStack {
                    GhostBtn(style: .icon2, size: .small, icon: Image(systemName: "pencil"))
                    GhostBtn(style: .icon2, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
            }
            .padding(100)
            .background(Color.Sub.gray50)
        }
    }
}
