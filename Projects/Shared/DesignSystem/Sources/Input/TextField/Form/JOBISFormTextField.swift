import SwiftUI

public struct JOBISFormTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var label: String
    @Binding var text: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    private var isErrorAndNotEmpty: Bool {
        isError && !errorMessage.isEmpty
    }

    public init(
        _ label: String = "",
        text: Binding<String>,
        isError: Bool = false,
        errorMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        _text = text
        self.isError = isError
        self.errorMessage = errorMessage
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .JOBISFont(
                    .body(.body4),
                    color: isEnabled ? .Sub.gray90 : .Sub.gray50
                )
                .focused($isFocused)
                .onSubmit(onCommit)

            Text(label)
                .JOBISFont(
                    .body(.body4),
                    color: isEnabled ? .Sub.gray60 : .Sub.gray50
                )
                .opacity(text.isEmpty ? 1 : 0)
                .onTapGesture {
                    isFocused = true
                }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            isEnabled ?
            Color.Sub.gray10 : .Sub.gray30
        )
        .overlay(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(
                    isError && isEnabled ? Color.State.error : isFocused ? .Sub.gray60 : .Sub.gray40,
                    lineWidth: 1
                )
        }
        .overlay(alignment: .bottomLeading) {
            if isErrorAndNotEmpty {
                Text(errorMessage)
                    .JOBISFont(
                        .etc(.caption),
                        color: .State.error
                    )
                    .opacity(isEnabled ? 1 : 0)
                    .offset(y: 20)
            }
        }
        .animation(.easeIn(duration: 0.3), value: isErrorAndNotEmpty)
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct JOBISloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            JOBISFormTextField(
                "placeholder",
                text: .constant(""),
                isError: false,
                errorMessage: "errorMessage",
                onCommit: {
                    print("asdf")
                })
            .disabled(false)
            .padding()
        }
    }
}