import SwiftUI

public struct ButtonInfo {
    let minWidth: CGFloat
    let minHeight: CGFloat
    let hPadding: CGFloat
    let cornerRadius: CGFloat
    let font: JOBISFontStyle
    public init(
        minWidth: CGFloat,
        minHeight: CGFloat,
        hPadding: CGFloat,
        cornerRadius: CGFloat,
        font: JOBISFontStyle
    ) {
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.hPadding = hPadding
        self.cornerRadius = cornerRadius
        self.font = font
    }
}
