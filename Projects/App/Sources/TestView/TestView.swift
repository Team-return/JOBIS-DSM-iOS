import SwiftUI
import DesignSystem

struct TestView: View {
    @Environment(\.isEnabled) private var isEnabled
    var body: some View {
        VStack {
            SolidBtn(text: "test", style: .defaultStyle) {
                print("test...\n")
            }
            .disabled(false)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
