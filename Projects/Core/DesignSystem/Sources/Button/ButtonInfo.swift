import SwiftUI

public struct ButtonInfo {
    let minWidth: CGFloat
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let font: JOBISFontStyle

    public init(
        minWidth: CGFloat,
        minHeight: CGFloat,
        cornerRadius: CGFloat,
        font: JOBISFontStyle
    ) {
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.font = font
    }
}
