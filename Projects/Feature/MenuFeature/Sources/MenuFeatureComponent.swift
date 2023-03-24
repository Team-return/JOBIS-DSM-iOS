import SwiftUI
import NeedleFoundation
import MenuFeatureInterface

public protocol MenuFeatureDependency: Dependency {}

public final class MenuFeatureComponent: Component<MenuFeatureDependency>, MenuFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
