import SwiftUI
import RootFeatureInterface
import NeedleFoundation

public protocol RootFeatureDependency: Dependency {}

public final class RootFeatureComponent: Component<RootFeatureDependency>, RootFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
