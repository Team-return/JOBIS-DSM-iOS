import SwiftUI

public struct GrayBtnStyle: ButtonStyle {
    var size: BtnSize
    public func makeBody(configuration: Configuration) -> some View {
            AnyView(DefaultButton(configuration: configuration, size: size))
    }
}

// MARK: - Usage
extension Button {
    func grayBtnStyle(_ style: BtnStyle, size: BtnSize) -> some View {
        self.buttonStyle(SolidBtnStyle(style: style, size: size))
    }
}

// MARK: - Default
extension GrayBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(size.fetchButtonInfo().font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                           : Color.Sub.gray50)
                .padding(.vertical, size.fetchButtonInfo().vPadding)
                .padding(.horizontal, size.fetchButtonInfo().hPadding)
                .frame(minWidth: size.fetchButtonInfo().minWidth, minHeight: size.fetchButtonInfo().minHeight)
                .background(configuration.isPressed ? Color.Sub.gray60 : Color.Sub.gray30)
                .cornerRadius(size.fetchButtonInfo().cornerRadius)
        }
    }
}
