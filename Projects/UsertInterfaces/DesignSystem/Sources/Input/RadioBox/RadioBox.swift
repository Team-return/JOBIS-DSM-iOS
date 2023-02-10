import SwiftUI

public struct RadioBox: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(RadioBoxStyle())
    }
}

struct RadioBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                RadioBox(isOn: .constant(false))
                    .disabled(true)
                RadioBox(isOn: .constant(false))
                    .disabled(false)
                RadioBox(isOn: .constant(true))
                    .disabled(true)
                RadioBox(isOn: .constant(true))
                    .disabled(false)            }
            .padding(10)
        }
    }
}
