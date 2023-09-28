// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum Error {
    public static let red = DesignSystemColors(name: "Red")
  }
  public enum Icons {
    public static let bookmarkOff = DesignSystemImages(name: "Bookmark-Off")
    public static let bookmarkOn = DesignSystemImages(name: "Bookmark-On")
    public static let checkBoxIcon = DesignSystemImages(name: "CheckBoxIcon")
    public static let chevronBarDown = DesignSystemImages(name: "Chevron-Bar-Down")
    public static let chevronDown = DesignSystemImages(name: "Chevron-Down")
    public static let chevronLeft = DesignSystemImages(name: "Chevron-Left")
    public static let chevronRight = DesignSystemImages(name: "Chevron-Right")
    public static let chevronUp = DesignSystemImages(name: "Chevron-Up")
    public static let close = DesignSystemImages(name: "Close")
    public static let input = DesignSystemColors(name: "input")
    public static let date = DesignSystemImages(name: "Date")
    public static let android = DesignSystemImages(name: "Android")
    public static let dataBase = DesignSystemImages(name: "DataBase")
    public static let jobis = DesignSystemImages(name: "Jobis")
    public static let webScreen = DesignSystemImages(name: "WebScreen")
    public static let ios = DesignSystemImages(name: "iOS")
    public static let download = DesignSystemImages(name: "Download")
    public static let eyeClose = DesignSystemImages(name: "Eye-Close")
    public static let eyeOpen = DesignSystemImages(name: "Eye-Open")
    public static let fileEarmarkArrowDown = DesignSystemImages(name: "File-Earmark-Arrow-Down")
    public static let fileEarmarkPlus = DesignSystemImages(name: "File-Earmark-Plus")
    public static let filterIcon = DesignSystemImages(name: "FilterIcon")
    public static let logout = DesignSystemImages(name: "Logout")
    public static let bookmarkListIcon = DesignSystemImages(name: "BookmarkListIcon")
    public static let fetchRecruitmentIcon = DesignSystemImages(name: "FetchRecruitmentIcon")
    public static let findCompanyIcon = DesignSystemImages(name: "FindCompanyIcon")
    public static let profileIcon = DesignSystemImages(name: "ProfileIcon")
    public static let militaryServiceExceptionIcon = DesignSystemImages(name: "MilitaryServiceExceptionIcon")
    public static let plus = DesignSystemImages(name: "Plus")
    public static let search = DesignSystemImages(name: "Search")
    public static let mypage = DesignSystemImages(name: "Mypage")
    public static let bookmark = DesignSystemImages(name: "bookmark")
    public static let house = DesignSystemImages(name: "house")
    public static let menu = DesignSystemImages(name: "menu")
    public static let toastError = DesignSystemImages(name: "Toast-Error")
    public static let toastMessage = DesignSystemImages(name: "Toast-Message")
    public static let toastSuccess = DesignSystemImages(name: "Toast-Success")
    public static let toastWarning = DesignSystemImages(name: "Toast-Warning")
    public static let trash = DesignSystemImages(name: "Trash")
    public static let upload = DesignSystemImages(name: "Upload")
    public static let isRecruitment = DesignSystemImages(name: "isRecruitment")
  }
  public enum Image {
    public static let findCompanyImage = DesignSystemImages(name: "FindCompanyImage")
    public static let keyImage = DesignSystemImages(name: "KeyImage")
    public static let recruitmentImage = DesignSystemImages(name: "RecruitmentImage")
    public static let splashLogo = DesignSystemImages(name: "SplashLogo")
    public static let verificationImage = DesignSystemImages(name: "VerificationImage")
  }
  public enum Main {
    public static let blue = DesignSystemColors(name: "Blue")
    public static let darkBlue = DesignSystemColors(name: "DarkBlue")
    public static let lightBlue = DesignSystemColors(name: "LightBlue")
  }
  public enum Message {
    public static let skyBlue = DesignSystemColors(name: "SkyBlue")
  }
  public enum Sub {
    public static let gray10 = DesignSystemColors(name: "Gray10")
    public static let gray20 = DesignSystemColors(name: "Gray20")
    public static let gray30 = DesignSystemColors(name: "Gray30")
    public static let gray40 = DesignSystemColors(name: "Gray40")
    public static let gray50 = DesignSystemColors(name: "Gray50")
    public static let gray60 = DesignSystemColors(name: "Gray60")
    public static let gray70 = DesignSystemColors(name: "Gray70")
    public static let gray80 = DesignSystemColors(name: "Gray80")
    public static let gray90 = DesignSystemColors(name: "Gray90")
  }
  public enum Success {
    public static let green = DesignSystemColors(name: "Green")
  }
  public enum Warning {
    public static let yellow = DesignSystemColors(name: "Yellow")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
public extension SwiftUI.Color {
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  init(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: DesignSystemImages, label: Text) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
