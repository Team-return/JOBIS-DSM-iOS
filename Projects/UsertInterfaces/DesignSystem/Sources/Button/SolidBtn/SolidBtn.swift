import SwiftUI

public struct SolidBtn: View {
    var text: String
    var style: SolidBtnStyle.Style
    var action: () -> Void
    var size: SolidBtnStyle.Size

    public init(
        text: String = "",
        style: SolidBtnStyle.Style = .defaultStyle,
        color: Color = .Main.lightBlue,
        action: @escaping () -> Void = {},
        size: SolidBtnStyle.Size = .medium
    ) {
        self.text = text
        self.style = style
        self.action = action
        self.size = size
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(SolidBtnStyle(style: style, size: size))
    }
}

struct SolidDefaultBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SolidBtn(text: "버튼", size: .small)
            SolidBtn(text: "버튼", size: .medium)
            SolidBtn(text: "버튼", size: .large)
        }
        .padding(100)
        .background(Color.Sub.gray50)
    }
}
