import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Color.Sub.gray10
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func jobisBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
