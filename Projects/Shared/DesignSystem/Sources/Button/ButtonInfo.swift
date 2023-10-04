import SwiftUI

public struct ButtonInfo {
    let minWidth: CGFloat
    let minHeight: CGFloat
    let vPadding: CGFloat
    let hPadding: CGFloat
    let cornerRadius: CGFloat
    let font: JOBISFontStyle

    public init(
        minWidth: CGFloat,
        minHeight: CGFloat,
        vPadding: CGFloat = 0,
        hPadding: CGFloat = 0,
        cornerRadius: CGFloat,
        font: JOBISFontStyle
    ) {
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.vPadding = vPadding
        self.hPadding = hPadding
        self.cornerRadius = cornerRadius
        self.font = font
    }
}
