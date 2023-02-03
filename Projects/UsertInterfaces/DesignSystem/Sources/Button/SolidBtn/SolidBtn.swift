import SwiftUI

public struct SolidBtn: View {
    var text: String
    var style: SolidBtnStyle.Style
    var action: () -> Void

    public init(
        text: String = "",
        style: SolidBtnStyle.Style = .defaultStyle,
        color: Color = .Main.lightBlue,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(SolidBtnStyle(style: style))
    }
}

struct SolidDefaultBtn_Previews: PreviewProvider {
    static var previews: some View {
//        VStack(spacing: 20) {
//            SolidDefaultBtn(text: "Contained")
//            SolidDefaultBtn(text: "Outlined", style: .outlined)
//            SolidDefaultBtn(text: "Text", style: .text)
//            SolidDefaultBtn(text: "Underline", style: .underline)
//        }
//        .padding()
//        .background(Color.Sub.gray90)
        SolidBtn(text: "버튼")
    }
}
