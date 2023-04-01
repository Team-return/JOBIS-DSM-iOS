import SwiftUI

public struct ShadowBtn: View {
    var text: String
    var style: BtnStyle
    var action: () -> Void
    var size: BtnSize
    var icon: Image
    var iconWidth: CGFloat
    var iconHeight: CGFloat

    public init(
        text: String,
        style: BtnStyle = .defaultStyle,
        action: @escaping () -> Void,
        size: BtnSize = .medium,
        icon: Image = Image(""),
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
        .buttonStyle(ShadowBtnStyle(style: style, size: size))
    }
}
// swiftlint:disable line_length

struct ShadowBtn_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    ShadowBtn(text: "버튼", style: .defaultStyle, action: {}, size: .small)
//                        .disabled(true)
                    ShadowBtn(text: "버튼", style: .defaultStyle, action: {}, size: .medium)
                    ShadowBtn(text: "버튼", style: .defaultStyle, action: {}, size: .large)
                }
                .padding(10)
                .background(.white)
                VStack {
                    ShadowBtn(text: "버튼", style: .lIcon, action: {}, size: .medium, icon: Image(systemName: "pencil"))
                    ShadowBtn(text: "버튼", style: .lIcon, action: {}, size: .large, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
                VStack {
                    ShadowBtn(text: "버튼", style: .rIcon, action: {}, size: .medium, icon: Image(systemName: "pencil"))
                    ShadowBtn(text: "버튼", style: .rIcon, action: {}, size: .large, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
                VStack {
                    ShadowBtn(text: "버튼", style: .icon1, action: {}, icon: Image(systemName: "pencil"))
                }
                .padding(10)
                .background(.white)
                VStack {
                    ShadowBtn(text: "버튼", style: .icon2, action: {}, size: .small, icon: Image(systemName: "pencil"))
                    ShadowBtn(text: "버튼", style: .icon2, action: {}, icon: Image(systemName: "pencil"), iconWidth: 26.4, iconHeight: 26.4)
                }
                .padding(10)
                .background(.white)
            }
            .padding(100)
            .background(Color.Sub.gray50)
        }
    }
}
