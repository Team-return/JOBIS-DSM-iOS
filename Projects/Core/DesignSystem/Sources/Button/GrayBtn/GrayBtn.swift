import SwiftUI

public struct GrayBtn: View {
    var text: String
    var action: () -> Void
    var size: BtnSize

    public init(
        text: String,
        size: BtnSize = .medium,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
        self.size = size
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                if size == .large {
                    Spacer()
                }
                Text(text)
                if size == .large {
                    Spacer()
                }
            }
        }
        .buttonStyle(GrayBtnStyle(size: size))
    }
}

struct GrayBtn_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    GrayBtn(text: "버튼", size: .small, action: {})
                    GrayBtn(text: "버튼", size: .medium, action: {})
                    GrayBtn(text: "버튼", size: .large, action: {})
                }
                .padding(10)
                .background(.white)
            }
            .padding(100)
            .background(Color.Sub.gray50)
        }
    }
}
