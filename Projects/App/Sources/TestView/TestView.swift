import SwiftUI
import DesignSystem

struct TestView: View {
    @State private var bool: Bool = false
    @State private var disabled: Bool = false
    var body: some View {
        VStack {
            CheckBox(isOn: $bool)
                .disabled(disabled)
            HStack {
                Text("bool")
                    .onTapGesture {
                        bool.toggle()
                    }
                Text("disabled")
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
