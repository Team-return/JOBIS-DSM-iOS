import SwiftUI

public struct JOBISRadioBoxStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {

        return ZStack {
            Circle()
                .foregroundColor(isEnabled ? .input : .Sub.gray50)
                .frame(width: 10, height: 10)
                .opacity(configuration.isOn ? 1.0 : 0)
                .padding(3)
                .overlay(
                    Circle()
                        .stroke(configuration.isOn ?
                                (isEnabled ? .input : Color.Sub.gray50) :
                                    (isEnabled ? .Sub.gray40 : .Sub.gray50), lineWidth: 1.5)
                )
        }
        .background(Circle().foregroundColor(isEnabled ? .Sub.gray10 : Color.Sub.gray40))
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.1)) {
                configuration.isOn.toggle()
            }
        }
    }
}
