import SwiftUI

public struct ToggleBtnStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
          configuration.label
          ZStack(alignment: configuration.isOn ? .trailing : .leading) {
            RoundedRectangle(cornerRadius: 30)
              .frame(width: 48, height: 24)
              .foregroundColor(isEnabled ? configuration.isOn ? .Icon.input : .Sub.gray50 :  .Sub.gray40)
            Circle()
              .frame(width: 18, height: 18)
              .padding(3)
              .foregroundColor(isEnabled ? .Sub.gray10 : .Sub.gray50)
              .onTapGesture {
                withAnimation {
                  configuration.$isOn.wrappedValue.toggle()
                }
              }
          }
        }
      }
}
