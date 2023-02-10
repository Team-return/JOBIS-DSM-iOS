import SwiftUI

public struct CheckboxStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {

        return ZStack {
            Image.CheckBox.checkMark
                .resizable()
                .frame(width: 11, height: 8)
                .opacity(configuration.isOn ? 1.0 : 0)
        }
        .frame(width: 20, height: 20)
        .background(configuration.isOn ? (isEnabled ? Color.Icon.input : .Sub.gray50) : (isEnabled ? .clear : .Sub.gray40))
        .border(configuration.isOn ? Color.clear : isEnabled ? Color.Sub.gray40
                : Color.Sub.gray50, width: 1.5)
        .cornerRadius(2)
        .frame(width: 44, height: 44)
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.1)) {
                configuration.isOn.toggle()
            }
        }
    }
}
