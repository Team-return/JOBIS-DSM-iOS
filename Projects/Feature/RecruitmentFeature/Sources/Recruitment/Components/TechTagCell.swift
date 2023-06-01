import SwiftUI
import DesignSystem

struct TechTagCell: View {
    let text: String
    let action: () -> Void
    let isSelected: Bool

    init(
        text: String,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
        self.isSelected = isSelected
    }

    var body: some View {
        if isSelected {
            SolidBtn(text: text, size: .small) {
                action()
            }
        } else {
            ShadowBtn(text: text, size: .small) {
                action()
            }
        }
    }
}
