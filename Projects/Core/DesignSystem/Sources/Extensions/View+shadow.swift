import SwiftUI

// swiftlint: disable identifier_name
public extension View {
    func shadow(
        color: Color = .black,
        opacity: CGFloat = 0.25,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0.0,
        spread: CGFloat = 0
    ) -> some View {
        let radius = blur / 2.0
        let spreadedX = x + spread
        let spreadedY = y + spread
        return shadow(
            color: color.opacity(opacity),
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
}
// swiftlint: enable identifier_name
