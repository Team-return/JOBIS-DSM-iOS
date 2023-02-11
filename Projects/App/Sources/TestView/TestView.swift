import SwiftUI
import DesignSystem

struct TestView: View {
    @State private var bool: Bool = false
    @State private var disabled: Bool = false
    var body: some View {
        VStack {
            HStack {
                JOBISRadioBox(isOn: $bool)
                    .disabled(disabled)
                JOBISCheckBox(isOn: $bool)
                    .disabled(disabled)
                JOBISToggleBtn(isOn: $bool)
                    .disabled(disabled)
            }
            HStack {
                Text(String(bool))
                    .onTapGesture {
                        bool.toggle()
                    }
                Text(String(disabled))
                    .onTapGesture {
                        disabled.toggle()
                    }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
