import SwiftUI
import NeedleFoundation
import MainTabFeatureInterface

public protocol MainTabDependency: Dependency {}

public final class MainTabComponent: Component<MainTabDependency>, MainTabFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
