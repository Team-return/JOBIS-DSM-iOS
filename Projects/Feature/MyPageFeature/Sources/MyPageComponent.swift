import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol MyPageDependency: Dependency {}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(viewModel: .init())
    }
}
