import SwiftUI
import HomeFeatureInterface
import NeedleFoundation

public protocol HomeDependency: Dependency {}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView(viewModel: .init())
    }
}
