import SwiftUI

public extension Color {
    struct State { }
}

public extension Color.State {
    static let warnig: Color = DesignSystemAsset.Warning.yellow.suiColor
    static let error: Color = DesignSystemAsset.Error.red.suiColor
    static let success: Color = DesignSystemAsset.Success.green.suiColor
    static let message: Color = DesignSystemAsset.Message.skyBlue.suiColor
}
