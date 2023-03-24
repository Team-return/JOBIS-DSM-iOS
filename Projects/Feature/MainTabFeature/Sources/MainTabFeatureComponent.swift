import SwiftUI
import MainTabFeatureInterface
import NeedleFoundation

public protocol MainTabFeatureDependency: Dependency {}

public final class MainTabFeatureComponent: Component<MainTabFeatureDependency>, MainTabFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
