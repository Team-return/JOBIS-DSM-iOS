import SwiftUI

public struct JOBISCheckBox: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(JOBISCheckboxStyle())
    }
}

struct JOBISCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISCheckBox(isOn: .constant(false))
                    .disabled(true)
                JOBISCheckBox(isOn: .constant(false))
                    .disabled(false)
                JOBISCheckBox(isOn: .constant(true))
                    .disabled(true)
                JOBISCheckBox(isOn: .constant(true))
                    .disabled(false)
            }
            .padding(10)
        }
    }
}
