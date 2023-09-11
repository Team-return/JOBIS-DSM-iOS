import SwiftUI

public struct LightBtnStyle: ButtonStyle {
    var style: BtnStyle
    var size: BtnSize

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

// MARK: - Usage
extension Button {
    func lightBtnStyle(_ style: BtnStyle, size: BtnSize) -> some View {
        self.buttonStyle(SolidBtnStyle(style: style, size: size))
    }
}

// MARK: - Default
extension LightBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(size.fetchButtonInfo().font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .padding(.vertical, size.fetchButtonInfo().vPadding)
                .padding(.horizontal, size.fetchButtonInfo().hPadding)
                .frame(minWidth: size.fetchButtonInfo().minWidth, minHeight: size.fetchButtonInfo().minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray30)
                .cornerRadius(size.fetchButtonInfo().cornerRadius)
        }
    }
}

// MARK: - L icon
extension LightBtnStyle {
    struct LIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(size.fetchButtonInfo().font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .frame(minWidth: size.fetchButtonInfo().minWidth, minHeight: size.fetchButtonInfo().minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray30)
                .cornerRadius(size.fetchButtonInfo().cornerRadius)
        }
    }
}

// MARK: - R icon
extension LightBtnStyle {
    struct RIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(size.fetchButtonInfo().font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .frame(minWidth: size.fetchButtonInfo().minWidth, minHeight: size.fetchButtonInfo().minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray30)
                .cornerRadius(size.fetchButtonInfo().cornerRadius)
        }
    }
}

// MARK: - Icon1
extension LightBtnStyle {
    struct Icon1Button: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                      : Color.Sub.gray50)
                .frame(width: 44, height: 44)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray30)
                .cornerRadius(3)
        }
    }
}

// MARK: - Icon2
extension LightBtnStyle {
    struct Icon2Button: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                      : Color.Sub.gray50)
                .frame(width: size.fetchButtonInfo().minHeight, height: size.fetchButtonInfo().minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray30)
                .clipShape(Circle())
        }
    }
}
