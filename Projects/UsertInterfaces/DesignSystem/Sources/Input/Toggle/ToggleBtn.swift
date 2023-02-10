import SwiftUI

public struct ToggleBtn: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(ToggleBtnStyle())
    }
}

struct ToggleBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                ToggleBtn(isOn: .constant(false))
                    .disabled(true)
                ToggleBtn(isOn: .constant(false))
                    .disabled(false)
                ToggleBtn(isOn: .constant(true))
                    .disabled(true)
                ToggleBtn(isOn: .constant(true))
                    .disabled(false)
            }
            .padding(10)
        }
    }
}
