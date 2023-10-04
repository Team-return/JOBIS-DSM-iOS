import SwiftUI

public struct JOBISToggleBtn: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(JOBISToggleBtnStyle())
    }
}

struct ToggleBtn_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISToggleBtn(isOn: .constant(false))
                    .disabled(true)
                JOBISToggleBtn(isOn: .constant(false))
                    .disabled(false)
                JOBISToggleBtn(isOn: .constant(true))
                    .disabled(true)
                JOBISToggleBtn(isOn: .constant(true))
                    .disabled(false)
            }
            .padding(10)
        }
    }
}
