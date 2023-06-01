import SwiftUI

public struct ShadowBtnStyle: ButtonStyle {
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
    func shadowBtnStyle(_ style: BtnStyle, size: BtnSize) -> some View {
        self.buttonStyle(ShadowBtnStyle(style: style, size: size))
    }
}

// MARK: - Default
extension ShadowBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray60
                           : Color.Sub.gray50)
                .padding(.vertical, fetchButtonInfo(size: size).vPadding)
                .padding(.horizontal, fetchButtonInfo(size: size).hPadding)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10
                            : Color.Sub.gray30)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .shadow(color: .Sub.gray90.opacity(0.25), radius: isEnabled ?  4 : 0)
        }
    }
}

// MARK: - L icon
extension ShadowBtnStyle {
    struct LIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10
                            : Color.Sub.gray30)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .shadow(radius: isEnabled ?  4 : 0)
        }
    }
}

// MARK: - R icon
extension ShadowBtnStyle {
    struct RIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10
                            : Color.Sub.gray30)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .shadow(radius: isEnabled ?  4 : 0)
        }
    }
}

// MARK: - Icon1
extension ShadowBtnStyle {
    struct Icon1Button: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                                 : Color.Sub.gray50)
                .frame(width: 44, height: 44)
                .background(isEnabled ? configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10
                            : Color.Sub.gray30)
                .cornerRadius(3)
                .shadow(radius: isEnabled ?  4 : 0)
        }
    }
}

// MARK: - Icon2
extension ShadowBtnStyle {
    struct Icon2Button: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Sub.gray90
                                 : Color.Sub.gray50)
                .frame(width: fetchButtonInfo(size: size).minHeight, height: fetchButtonInfo(size: size).minHeight)
                .background(isEnabled ? configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10
                            : Color.Sub.gray30)
                .clipShape(Circle())
                .shadow(radius: isEnabled ?  4 : 0)
        }
    }
}
