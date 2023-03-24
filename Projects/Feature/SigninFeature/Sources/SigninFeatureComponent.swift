import SwiftUI
import SigninFeatureInterface
import NeedleFoundation

public protocol SigninFeatureDependency: Dependency {}

public final class SigninFeatureComponent: Component<SigninFeatureDependency>, SigninFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
