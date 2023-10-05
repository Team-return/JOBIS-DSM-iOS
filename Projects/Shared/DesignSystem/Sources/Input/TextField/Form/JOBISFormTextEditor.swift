import SwiftUI

public struct JOBISFormTextEditor: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var placeholder: String
    @Binding var text: String
    var minHeight: CGFloat
    @FocusState var isFocused: Bool

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        minHeight: CGFloat = 200
    ) {
        self.placeholder = placeholder
        _text = text
        self.minHeight = minHeight
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            Text(placeholder)
                .JOBISFont(
                    .body(.body4),
                    color: isEnabled ? .Sub.gray60 : .Sub.gray50
                )
                .opacity(text.isEmpty ? 1 : 0)
                .padding(.top, 10)
                .padding(.leading, 12)

            TextEditor(text: $text)
                .JOBISFont(
                    .body(.body4),
                    color: isEnabled ? .Sub.gray90 : .Sub.gray50
                )
                .padding(.top, 2)
                .padding(.leading, 7)
                .colorMultiply(
                    isEnabled ?
                    Color.Sub.gray10 : .Sub.gray30
                )
        }
        .frame(minHeight: minHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(
                    isEnabled ? Color.Sub.gray40 : isFocused ? .Sub.gray60 : .Sub.gray40,
                    lineWidth: 1
                )
        )
        .background(
            isEnabled ?
            Color.Sub.gray10 : .Sub.gray30
        )
        .animation(.easeIn(duration: 0.2), value: isFocused)
    }
}

struct DMSFormTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        JOBISFormTextEditor(text: .constant(""))
    }
}
