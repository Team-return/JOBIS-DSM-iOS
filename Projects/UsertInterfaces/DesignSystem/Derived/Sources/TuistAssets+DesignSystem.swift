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

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum Error {
    public static let red = DesignSystemColors(name: "Red")
  }
  public enum Icons {
  }
  public enum Main {
    public static let blue = DesignSystemColors(name: "Blue")
    public static let darkBlue = DesignSystemColors(name: "DarkBlue")
    public static let lightBlue = DesignSystemColors(name: "LightBlue")
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

// swiftlint:enable all
// swiftformat:enable all
