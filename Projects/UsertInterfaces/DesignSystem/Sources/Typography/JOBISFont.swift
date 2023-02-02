import SwiftUI

public struct JOBISFont: ViewModifier {
    public var style: JOBISFontStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .heading(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))

        case let .body(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))

        case let .etc(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))
        }
    }
}

public extension View {
    func JOBISFont(_ style: JOBISFontStyle) -> some View {
        self
            .modifier(DesignSystem.JOBISFont(style: style))
    }

    func dmsFont(_ style: JOBISFontStyle, color: Color) -> some View {
        self
            .JOBISFont(style)
            .foregroundColor(color)
    }
}
