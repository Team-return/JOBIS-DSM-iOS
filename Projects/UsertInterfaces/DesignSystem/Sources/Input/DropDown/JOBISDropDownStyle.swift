import SwiftUI

public struct JOBISDropDownStyle: MenuStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Text("")
        }
    }
}
