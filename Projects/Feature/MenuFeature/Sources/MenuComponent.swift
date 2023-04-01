import SwiftUI
import MenuFeatureInterface
import NeedleFoundation

public protocol MenuDependency: Dependency {}

public final class MenuComponent: Component<MenuDependency>, MenuFactory {
    public func makeView() -> some View {
        MenuView(viewModel: .init())
    }
}
