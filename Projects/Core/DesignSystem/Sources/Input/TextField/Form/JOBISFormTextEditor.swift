import SwiftUI

public struct JOBISFormTextEditor: View {
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
        UITextView.appearance().backgroundColor = .clear
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .JOBISFont(.body(.body4), color: .Sub.gray90)
                .padding(.top, 2)
                .padding(.leading, 7)

            Text(placeholder)
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .opacity(text.isEmpty ? 1 : 0)
                .padding(.top, 10)
                .padding(.leading, 12)
        }
        .frame(minHeight: minHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(
                    isFocused ? Color.Sub.gray60 : .Sub.gray40,
                    lineWidth: 1
                )
        )
        .background(Color.Sub.gray10)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct DMSFormTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        JOBISFormTextEditor(text: .constant(""))
    }
}
