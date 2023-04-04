import SwiftUI

public enum JOBISToastStyle {
    case message
    case error
    case success
    case warning
}

public extension JOBISToastStyle {
    var icon: Image {
        switch self {
        case .message:
            return DesignSystemAsset.Icons.toastMessage.swiftUIImage

        case .error:
            return DesignSystemAsset.Icons.toastError.swiftUIImage

        case .success:
            return DesignSystemAsset.Icons.toastSuccess.swiftUIImage

        case .warning:
            return DesignSystemAsset.Icons.toastWarning.swiftUIImage
        }
    }

    var textForeground: Color {
        switch self {
        case .message:
            return .State.message

        case .error:
            return .State.error

        case .success:
            return .State.success

        case .warning:
            return .State.warnig
        }
    }

    var size: CGSize {
        switch self {
        case .message:
            return .init(width: 35, height: 35)
        case .error:
            return .init(width: 29, height: 29)
        case .success:
            return .init(width: 29, height: 29)
        case .warning:
            return .init(width: 29, height: 29)
        }
    }
}
