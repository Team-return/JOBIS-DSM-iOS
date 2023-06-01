import SwiftUI

public func fetchButtonInfo(size: BtnSize) -> ButtonInfo {
    switch size {
    case .small:
        return ButtonInfo(
            minWidth: 70,
            minHeight: 30,
            vPadding: 5,
            hPadding: 20,
            cornerRadius: 15,
            font: .body(.body4))
    case .medium:
        return ButtonInfo(
            minWidth: 130,
            minHeight: 44,
            vPadding: 6,
            hPadding: 45,
            cornerRadius: 8,
            font: .heading(.heading6))
    case .large:
        return ButtonInfo(
            minWidth: 0,
            minHeight: 50,
            cornerRadius: 12,
            font: .heading(.heading6))
    }
}
