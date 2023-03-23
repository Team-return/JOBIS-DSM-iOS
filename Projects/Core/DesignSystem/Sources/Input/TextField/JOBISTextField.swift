import SwiftUI

public struct JOBISTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var label: String
    @Binding var text: String
    var isError: Bool
    var errorMessage: String
    var bottomMessage: String
    var topMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    public init(
        _ label: String = "",
        text: Binding<String>,
        isError: Bool = false,
        errorMessage: String = "",
        bottomMessage: String = "",
        topMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        _text = text
        self.isError = isError
        self.errorMessage = errorMessage
        self.bottomMessage = bottomMessage
        self.topMessage = topMessage
        self.onCommit = onCommit
    }
    public var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .JOBISFont(.body(.body1), color: .Sub.gray60)
                .opacity(text.isEmpty ? 1 : 0)
            VStack(alignment: .leading, spacing: 10) {
                TextField("", text: $text)
                    .JOBISFont(.body(.body2),
                               color: isEnabled ?
                        .Sub.gray90 :
                            .Sub.gray50)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 3)
                .strokeBorder(
                    isEnabled ?
                    isError ?
                        .State.error :
                        isFocused ?
                    Color.Sub.gray60 :
                            .Sub.gray40 :
                            .Sub.gray40
                    ,
                    lineWidth: 1
                )
        )
        .background(isEnabled ? Color.Sub.gray10 : .Sub.gray30)
        .focused($isFocused)
        .onSubmit(onCommit)
        .overlay(alignment: .topLeading) {
            Text(isError ? errorMessage : bottomMessage)
                .JOBISFont(.etc(.caption),
                           color: isError ?
                    .State.error :
                        .Sub.gray60)
                .opacity(isEnabled ? 1 : 0)
                .offset(y: 37)
        }
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct JOBISTextField_Previews: PreviewProvider {
    static var previews: some View {
        JOBISTextField("Placeholder", text: .constant("asdf`````"), isError: true, errorMessage: "this is error")
            .disabled(false)
            .padding()
    }
}
