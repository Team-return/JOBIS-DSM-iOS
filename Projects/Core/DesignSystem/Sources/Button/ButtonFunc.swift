import SwiftUI

public func fetchButtonInfo(size: BtnSize) -> ButtonInfo {
    switch size {
    case .small:
        return ButtonInfo(
            minWidth: 70,
            minHeight: 30,
            hPadding: 20,
            cornerRadius: 15,
            font: .body(.body2))
    case .medium:
        return ButtonInfo(
            minWidth: 130,
            minHeight: 44,
            hPadding: 15,
            cornerRadius: 8,
            font: .heading(.heading6))
    case .large:
        return ButtonInfo(
            minWidth: 320,
            minHeight: 50,
            hPadding: 10,
            cornerRadius: 12,
            font: .heading(.heading6))
    }
}
