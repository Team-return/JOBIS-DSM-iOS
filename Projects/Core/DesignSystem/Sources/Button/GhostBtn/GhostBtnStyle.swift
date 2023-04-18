import SwiftUI

public struct GhostBtnStyle: ButtonStyle {
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
    func ghostBtnStyle(_ style: BtnStyle, size: BtnSize) -> some View {
        self.buttonStyle(GhostBtnStyle(style: style, size: size))
    }
}

// MARK: - Default
extension GhostBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: fetchButtonInfo(size: size).cornerRadius)
                        .stroke(isEnabled ? Color.Main.lightBlue
                                : Color.Sub.gray40, lineWidth: 1.5)
                )
        }
    }
}

// MARK: - L icon
extension GhostBtnStyle {
    struct LIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: fetchButtonInfo(size: size).cornerRadius)
                        .stroke(isEnabled ? Color.Main.lightBlue
                                : Color.Sub.gray40, lineWidth: 1.5)
                )
        }
    }
}

// MARK: - R icon
extension GhostBtnStyle {
    struct RIconButton: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(fetchButtonInfo(size: size).font,
                           color: isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                           : Color.Sub.gray50)
                .frame(minWidth: fetchButtonInfo(size: size).minWidth, minHeight: fetchButtonInfo(size: size).minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10)
                .cornerRadius(fetchButtonInfo(size: size).cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: fetchButtonInfo(size: size).cornerRadius)
                        .stroke(isEnabled ? Color.Main.lightBlue
                                : Color.Sub.gray40, lineWidth: 1.5)
                )
        }
    }
}

// MARK: - Icon1
extension GhostBtnStyle {
    struct Icon1Button: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                                 : Color.Sub.gray50)
                .frame(width: 44, height: 44)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10)
                .background(Color.Main.lightBlue)
                .cornerRadius(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(isEnabled ? Color.Main.lightBlue
                                : Color.Sub.gray40, lineWidth: 1.5)
                )
        }
    }
}

// MARK: - Icon2
extension GhostBtnStyle {
    struct Icon2Button: View {
        let configuration: ButtonStyle.Configuration
        let size: BtnSize
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(isEnabled ? configuration.isPressed ? Color.Sub.gray10 : Color.Main.lightBlue
                      : Color.Sub.gray50)
                .frame(width: fetchButtonInfo(size: size).minHeight, height: fetchButtonInfo(size: size).minHeight)
                .background(configuration.isPressed ? Color.Main.lightBlue : Color.Sub.gray10)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(isEnabled ? Color.Main.lightBlue
                                : Color.Sub.gray40, lineWidth: 1.5)
                )
        }
    }
}
