import SwiftUI

public struct SolidBtnStyle: ButtonStyle {
    public enum Style {
        case defaultStyle
        case lIcon
        case rIcon
        case icon1
        case icon2
    }
    public enum Size {
        case small
        case medium
        case large
    }

    var style: Style
    var size: Size

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .defaultStyle:
            return AnyView(DefaultButton(configuration: configuration, size: size))
        case .lIcon:
            return AnyView(LIconButton(configuration: configuration, size: size))
        case .rIcon:
            return AnyView(RIconButton(configuration: configuration, size: size))
        case .icon1:
            return AnyView(Icon1Button(configuration: configuration))
        case .icon2:
            return AnyView(Icon2Button(configuration: configuration, size: size))
        }
    }
}

public struct ButtonStruct {
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

public func buttonSize(size: SolidBtnStyle.Size) -> ButtonStruct {
    switch size {
    case .small:
        return ButtonStruct(
            minWidth: 70,
            minHeight: 30,
            hPadding: 20,
            cornerRadius: 15,
            font: .body(.body2))
    case .medium:
        return ButtonStruct(
            minWidth: 130,
            minHeight: 44,
            hPadding: 15,
            cornerRadius: 8,
            font: .heading(.heading6))
    case .large:
        return ButtonStruct(
            minWidth: 320,
            minHeight: 50,
            hPadding: 10,
            cornerRadius: 12,
            font: .heading(.heading6))
    }
}

// MARK: - Usage
extension Button {
    func solidBtnStyle(_ style: SolidBtnStyle.Style, size: SolidBtnStyle.Size) -> some View {
        self.buttonStyle(SolidBtnStyle(style: style, size: size))
    }
}

// MARK: - Default
extension SolidBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        let size: SolidBtnStyle.Size
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(buttonSize(size: size).font, color: .white)
                .padding(.horizontal, buttonSize(size: size).hPadding)
                .frame(minWidth: buttonSize(size: size).minWidth, minHeight: buttonSize(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .cornerRadius(buttonSize(size: size).cornerRadius)
        }
    }
}

// MARK: - L icon
extension SolidBtnStyle {
    struct LIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: SolidBtnStyle.Size
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(buttonSize(size: size).font, color: .white)
                .padding(.horizontal, buttonSize(size: size).hPadding)
                .frame(minWidth: buttonSize(size: size).minWidth, minHeight: buttonSize(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .cornerRadius(buttonSize(size: size).cornerRadius)
        }
    }
}

// MARK: - R icon
extension SolidBtnStyle {
    struct RIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: SolidBtnStyle.Size
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(buttonSize(size: size).font, color: .white)
                .padding(.horizontal, buttonSize(size: size).hPadding)
                .frame(minWidth: buttonSize(size: size).minWidth, minHeight: buttonSize(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .cornerRadius(buttonSize(size: size).cornerRadius)
        }
    }
}

// MARK: - Icon1
extension SolidBtnStyle {
    struct Icon1Button: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .background(Color.Main.lightBlue)
                .cornerRadius(3)
        }
    }
}

// MARK: - Icon2
extension SolidBtnStyle {
    struct Icon2Button: View {
        let configuration: ButtonStyle.Configuration
        let size: SolidBtnStyle.Size
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(buttonSize(size: size).font, color: .white)
                .frame(width: buttonSize(size: size).minHeight, height: buttonSize(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .clipShape(Circle())
        }
    }
}
