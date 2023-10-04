import SwiftUI

public struct JOBISRadioBox: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(JOBISRadioBoxStyle())
    }
}

struct RadioBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISRadioBox(isOn: .constant(false))
                    .disabled(true)
                JOBISRadioBox(isOn: .constant(false))
                    .disabled(false)
                JOBISRadioBox(isOn: .constant(true))
                    .disabled(true)
                JOBISRadioBox(isOn: .constant(true))
                    .disabled(false)            }
            .padding(10)
        }
    }
}
