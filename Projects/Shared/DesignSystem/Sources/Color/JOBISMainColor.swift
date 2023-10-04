import SwiftUI

public extension Color {
    struct Main { }
}

public extension Color.Main {
    static let lightBlue: Color = DesignSystemAsset.Main.lightBlue.suiColor
    static let blue: Color = DesignSystemAsset.Main.blue.suiColor
    static let darkBlue: Color = DesignSystemAsset.Main.darkBlue.suiColor
}
