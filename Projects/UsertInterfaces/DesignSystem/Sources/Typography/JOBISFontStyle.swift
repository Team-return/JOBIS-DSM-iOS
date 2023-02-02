import SwiftUI

protocol JOBISFontable {
    var size: CGFloat { get }
    var weight: JOBISFontWeight { get }
}

public enum JOBISFontWeight: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
}

public enum JOBISFontStyle: Hashable {
    case heading(JOBISFontStyle.Heading)
    case body(JOBISFontStyle.Body)
    case etc(JOBISFontStyle.Etc)

    public enum Heading: CGFloat, JOBISFontable {
        case heading1
        case heading2
        case heading3
        case heading4
        case heading5
        case heading6
        var size: CGFloat {
            switch self {
            case .heading1: return 40
            case .heading2: return 36
            case .heading3: return 32
            case .heading4: return 28
            case .heading5: return 24
            case .heading6: return 20
            }
        }
    }
    
    public enum Body: CGFloat, JOBISFontable {
        case body1
        case body2
        case body3
        case body4
        var size: CGFloat {
            switch self {
            case .body1: return 18
            case .body2: return 16
            case .body3: return 14
            case .body4: return 14
            }
        }
    }

    public enum Etc: CGFloat, JOBISFontable {
        case caption = 12
    }
}

// MARK: - FontableSize
extension JOBISFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Heading
public extension JOBISFontStyle.Heading {
    var weight: JOBISFontWeight {
        switch self {
        case .heading1, .heading2, .heading3:
            return .bold
        case .heading4, .heading5, .heading6:
            return .medium
        }
    }
}

// MARK: - Text
public extension JOBISFontStyle.Body {
    var weight: JOBISFontWeight {
        switch self {
        case .body1, .body2, .body4:
            return .regular
        case .body3:
            return .medium
        }
    }
}

// MARK: - Button
public extension JOBISFontStyle.Etc {
    var weight: JOBISFontWeight {
        switch self {
        case .caption:
            return .regular
        }
    }
}
