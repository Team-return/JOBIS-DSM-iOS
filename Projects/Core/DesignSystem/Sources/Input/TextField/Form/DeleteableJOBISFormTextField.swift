import SwiftUI

public struct DeleteableJOBISFormTextField<T>: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var label: String
    @Binding var text: String
    @Binding var deleteArray: [T]
    var deleteIndex: Int
    var onCommit: () -> Void
    @FocusState var isFocused: Bool

    public init(
        _ label: String = "",
        text: Binding<String>,
        deleteArray: Binding<[T]>,
        deleteIndex: Int,
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        _text = text
        _deleteArray = deleteArray
        self.deleteIndex = deleteIndex
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                TextField("", text: $text)
                    .JOBISFont(
                        .body(.body4),
                        color: isEnabled ? .Sub.gray90 : .Sub.gray50
                )
                .focused($isFocused)
                .onSubmit(onCommit)

                Button {
                    deleteArray.remove(at: deleteIndex)
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.Sub.gray90)
                }
            }

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
                    isFocused ? Color.Sub.gray60 : .Sub.gray40,
                    lineWidth: 1
                )
        }
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct DeleteableJOBISFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DeleteableJOBISFormTextField<String>(
                "placeholder",
                text: .constant(""),
                deleteArray: .constant(["ASDF"]),
                deleteIndex: 0,
                onCommit: {
                    print("asdf")
                })
            .disabled(false)
            .padding()
        }
    }
}
