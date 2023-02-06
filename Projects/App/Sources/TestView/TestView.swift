import SwiftUI
import DesignSystem

struct TestView: View {
    var body: some View {
        VStack {
            SolidBtn(text: "test", style: .defaultStyle) {
                print("test...\n")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
