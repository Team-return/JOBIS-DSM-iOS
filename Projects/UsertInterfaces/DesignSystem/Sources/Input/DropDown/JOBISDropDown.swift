import SwiftUI

public struct JOBISDropDown: View {
    @State private var selection: String = ""
    var selections: [String]
    @Environment(\.isEnabled) private var isEnabled: Bool

    public var body: some View {
        Picker("", selection: $selection, content: {
            ForEach(0 ..< selections.count) {
                Text(selections[$0])
            }
        })
        .labelsHidden()
    }
}

struct JOBISDropDown_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISDropDown(selections: [
                    "A", "B", "C"
                ])
            }
            .padding(10)
        }
    }
}
