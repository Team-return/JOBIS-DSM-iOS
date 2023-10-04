import SwiftUI

public struct SolidBtn: View {
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
        size: BtnSize = .medium,
        icon: Image = Image(""),
        iconWidth: CGFloat = 20,
        iconHeight: CGFloat = 20,
        action: @escaping () -> Void
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
                if size == .large {
                    Spacer()
                }
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
                if size == .large {
                    Spacer()
                }
            }
        }
        .buttonStyle(SolidBtnStyle(style: style, size: size))
    }
}
