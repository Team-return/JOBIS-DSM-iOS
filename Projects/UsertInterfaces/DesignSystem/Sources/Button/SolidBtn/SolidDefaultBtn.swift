import SwiftUI

public struct SolidBtnStyle: ButtonStyle {
    public enum Style {
        case defaultStyle
        case lIcon
        case rIcon
        case icon1
        case icon2
    }

    var style: Style

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .defaultStyle:
            return AnyView(DefaultButton(configuration: configuration))
        case .lIcon:
            return AnyView(LIconButton(configuration: configuration))
        case .rIcon:
            return AnyView(RIconButton(configuration: configuration))
        case .icon1:
            return AnyView(Icon1Button(configuration: configuration))
        case .icon2:
            return AnyView(Icon2Button(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func solidBtnStyle(_ style: SolidBtnStyle.Style, color: Color) -> some View {
        self.buttonStyle(SolidBtnStyle(style: style))
    }
}

// MARK: - Default
extension SolidBtnStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .JOBISFont(.body(.body2), color: .white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(isEnabled ? configuration.isPressed ? Color.Main.darkBlue : Color.Main.lightBlue
                            : Color.Sub.gray50)
                .cornerRadius(15)
        }
    }
}

// MARK: - L icon
extension SolidBtnStyle {
    struct LIconButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
//                .padding(.vertical, 8.5)
//                .padding(.horizontal, 16)
//                .dmsFont(.etc(.button))
//                .background(color)
//                .foregroundColor(.GrayScale.gray1)
//                .cornerRadius(5)
//                .opacity(
//                    isEnabled ?
//                        configuration.isPressed ? 0.7 : 1.0 :
//                        0.5
//                )
        }
    }
}

// MARK: - R icon
extension SolidBtnStyle {
    struct RIconButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
//                .padding(.vertical, 14)
//                .padding(.horizontal, 16)
//                .dmsFont(.etc(.button))
//                .background(.clear)
//                .foregroundColor(color)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(color, lineWidth: 1)
//                }
//                .opacity(
//                    isEnabled ?
//                        configuration.isPressed ? 0.7 : 1.0 :
//                        0.5
//                )
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
//                .padding(.vertical, 8.5)
//                .padding(.horizontal, 16)
//                .dmsFont(.etc(.button))
//                .background(.clear)
//                .foregroundColor(color)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(color, lineWidth: 1)
//                }
//                .opacity(
//                    isEnabled ?
//                        configuration.isPressed ? 0.7 : 1.0 :
//                        0.5
//                )
        }
    }
}

// MARK: - Icon2
extension SolidBtnStyle {
    struct Icon2Button: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
//                .dmsFont(
//                    .etc(.button))
//                .foregroundColor(color)
//                .opacity(
//                    isEnabled ?
//                    configuration.isPressed ? 0.7 : 1.0 :
//                        0.5
//                )
        }
    }
}
