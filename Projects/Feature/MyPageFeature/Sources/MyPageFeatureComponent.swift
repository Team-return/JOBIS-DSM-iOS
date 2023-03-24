import SwiftUI
import MyPageFeatureInterface
import NeedleFoundation

public protocol MyPageFeatureDependency: Dependency {}

public final class MyPageFeatureComponent: Component<MyPageFeatureDependency>, MyPageFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
