import SwiftUI

public struct GrayBtn: View {
    var text: String
    var action: () -> Void
    var size: BtnSize

    public init(
        text: String = "",
        action: @escaping () -> Void = {},
        size: BtnSize = .medium
    ) {
        self.text = text
        self.action = action
        self.size = size
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(GrayBtnStyle(size: size))
    }
}

struct GrayBtn_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    GrayBtn(text: "버튼", size: .small)
                    GrayBtn(text: "버튼", size: .medium)
                    GrayBtn(text: "버튼", size: .large)
                }
                .padding(10)
                .background(.white)
            }
            .padding(100)
            .background(Color.Sub.gray50)
        }
    }
}
