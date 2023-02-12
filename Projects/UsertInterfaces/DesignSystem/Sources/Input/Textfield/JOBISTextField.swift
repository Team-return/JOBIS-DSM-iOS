import SwiftUI

public struct JOBISTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var label: String
    @Binding var text: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    private var isFloaintg: Bool {
        isFocused || !text.isEmpty
    }
    private var isErrorAndNotEmpty: Bool {
        isError && !errorMessage.isEmpty
    }
    private var jobisForegroundColor: Color {
        isEnabled ?
        isError ?
            .State.error :
        isFocused ?
            .Main.lightBlue :
            .Sub.gray60 :
            .Sub.gray40
        
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
            Text(label)
                .JOBISFont(.body(.body1), color: .Sub.gray60)
                .opacity(text.isEmpty ? 1 : 0)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 10) {
                TextField("", text: $text)
                    .JOBISFont(.body(.body2), color: .Sub.gray90)
                    .foregroundColor(jobisForegroundColor)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(jobisForegroundColor)
                            .frame(height: 2)
                            .offset(y: 7)
                    }
                    .focused($isFocused)
                    .onSubmit(onCommit)
                    .padding(.leading, 16)
                if isErrorAndNotEmpty {
                    Text(errorMessage)
                        .JOBISFont(.etc(.caption), color: .State.error)
                        .offset(x: 5)
                }
            }
        }
        .animation(.easeIn(duration: 0.3), value: isErrorAndNotEmpty)
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFloaintg)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct JOBISTextField_Previews: PreviewProvider {
    static var previews: some View {
        JOBISTextField("Placeholder", text: .constant("asdf"))
    }
}
