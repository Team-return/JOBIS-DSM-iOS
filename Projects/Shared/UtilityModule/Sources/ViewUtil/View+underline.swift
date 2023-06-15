import SwiftUI

struct UnderlineTextModifier: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .underline(color: color)
        } else {
            content
                .font(.body)
                .overlay(
                    Rectangle()
                        .fill(color)
                        .frame(height: 1)
                        .padding(.top, 3),
                    alignment: .bottom)
        }
    }
}

public extension View {
    func underlineText(color: Color) -> some View {
        self.modifier(UnderlineTextModifier(color: color))
    }
}
