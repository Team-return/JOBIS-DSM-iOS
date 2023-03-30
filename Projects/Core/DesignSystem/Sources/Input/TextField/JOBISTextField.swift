import SwiftUI

public struct JOBISTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var placeholder: String
    @Binding var text: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool

    var textfieldType: TextFieldType
    var textfieldOutlinedType: TextFieldOutlinedType
    var bottomMessage: String
    var topMessage: String
    @State private var isPWSecure = true

    public init(
        placeholder: String,
        text: Binding<String>,
        isError: Bool,
        errorMessage: String,
        textfieldType: TextFieldType = .none,
        textfieldOutlinedType: TextFieldOutlinedType,
        bottomMessage: String = "",
        topMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.isError = isError
        self.errorMessage = errorMessage
        self.textfieldType = textfieldType
        self.textfieldOutlinedType = textfieldOutlinedType
        self.bottomMessage = bottomMessage
        self.topMessage = topMessage
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .JOBISFont(
                    .body(.body1),
                    color: isEnabled ? .Sub.gray60 : .Sub.gray50
                )
                .opacity(text.isEmpty ? 1 : 0)
            HStack {
                jobisTextfield()
                Spacer()
                textFieldIcon()
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .overlay(alignment: .bottom) {
            if textfieldOutlinedType == .outlined {
                RoundedRectangle(cornerRadius: 3)
                    .strokeBorder(
                        isError && isEnabled ? Color.State.error : isFocused ? .Sub.gray60 : .Sub.gray40,
                        lineWidth: 1
                    )
            } else {
                Divider()
                    .frame(height: 2)
                    .background(isError && isEnabled ? Color.State.error : isFocused ? .Main.lightBlue : .Sub.gray40)
            }
        }
        .background(
            textfieldOutlinedType == .outlined ?
            isEnabled ?
            Color.Sub.gray10 : .Sub.gray30 : .clear
        )
        .focused($isFocused)
        .onSubmit(onCommit)
        .overlay(alignment: .topLeading) {
            Text(isError ? errorMessage : bottomMessage)
                .JOBISFont(
                    .etc(.caption),
                    color: isError ? .State.error : .Sub.gray60
                )
                .opacity(isEnabled ? 1 : 0)
                .offset(y: 40)
        }
        .overlay(alignment: .topLeading) {
            Text(topMessage)
                .JOBISFont(
                    .etc(.caption),
                    color: isEnabled ? isError ? .State.error : .Sub.gray60 : .Sub.gray50
                )
                .offset(y: -18)
        }
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }

    @ViewBuilder
    func jobisTextfield() -> some View {
        Group {
            if textfieldType == .password && isPWSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .JOBISFont(
            .body(.body2),
            color: isEnabled ? .Sub.gray90 : .Sub.gray50
        )
    }

    @ViewBuilder
    func textFieldIcon() -> some View {
        switch textfieldType {
        case .none:
            EmptyView()
        case .password:
            Button {
                isPWSecure.toggle()
            } label: {
                Image(systemName: isPWSecure ? "eye" : "eye.slash")
                    .foregroundColor(
                        isEnabled ? isError ? .State.error : .Sub.gray90 : .Sub.gray50
                    )
            }
        case .search:
            Button {
                onCommit()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(
                        isEnabled ? isError ? .State.error : .Sub.gray90 : .Sub.gray50
                    )
            }
        }
    }
}

struct JOBISTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            JOBISTextField(
                placeholder: "placeholder",
                text: .constant(""),
                isError: false,
                errorMessage: "errorMessage",
                textfieldType: .none,
                textfieldOutlinedType: .bottomlined,
                bottomMessage: "BottomMessage",
                topMessage: "TopMessage",
                onCommit: {
                    print("asdf")
                })
            .disabled(false)
            .padding()
            JOBISTextField(
                placeholder: "비밀번호를 입력해주세요",
                text: .constant("gtw030488"),
                isError: true,
                errorMessage: "비밀번호를 다시 입력해주세요.",
                textfieldType: .password,
                textfieldOutlinedType: .bottomlined,
                bottomMessage: "@#$%@#$^ <- 이거 다들어가게 넣여용 ^^",
                topMessage: "비밀번호",
                onCommit: {
                }
            )
            .disabled(false)
            .padding()
            JOBISTextField(
                placeholder: "placeholder",
                text: .constant(""),
                isError: false,
                errorMessage: "errorMessage",
                textfieldType: .password,
                textfieldOutlinedType: .outlined,
                bottomMessage: "BottomMessage",
                topMessage: "TopMessage",
                onCommit: {
                    print("asdf")
                })
            .disabled(false)
            .padding()
            JOBISTextField(
                placeholder: "비밀번호를 입력해주세요",
                text: .constant("gtw030488"),
                isError: true,
                errorMessage: "비밀번호를 다시 입력해주세요.",
                textfieldType: .password,
                textfieldOutlinedType: .outlined,
                bottomMessage: "@#$%@#$^ <- 이거 다들어가게 넣여용 ^^",
                topMessage: "비밀번호",
                onCommit: {
                }
            )
            .disabled(false)
            .padding()
        }
    }
}
