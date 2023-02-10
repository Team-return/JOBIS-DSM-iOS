import SwiftUI

public struct CheckBox: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(CheckboxStyle())
    }
}

struct DMSCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                CheckBox(isOn: .constant(false))
                    .disabled(true)
                    .padding()
            }
            .padding(10)
//            .background(.blue)
        }
    }
}
