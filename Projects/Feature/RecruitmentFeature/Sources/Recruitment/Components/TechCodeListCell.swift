import SwiftUI
import DesignSystem

struct TechCodeListCell: View {
    let title: String
    let isChecked: Bool
    let action: () -> Void

    init(title: String, isChecked: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isChecked = isChecked
        self.action = action
    }

    var body: some View {
        HStack {
            JOBISCheckBox(isOn: .constant(isChecked))

            Text(title)
                .JOBISFont(.body(.body3), color: .Sub.gray60)

            Spacer()
        }
        .overlay {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture { action() }
        }
    }
}
