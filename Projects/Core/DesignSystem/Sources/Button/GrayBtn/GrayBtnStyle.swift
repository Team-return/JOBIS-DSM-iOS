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
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(configuration.isPressed ? Color.Sub.gray60 : Color.Sub.gray30)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
        }
    }
}
