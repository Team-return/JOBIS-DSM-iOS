import SwiftUI
import NeedleFoundation
import SigninFeatureInterface

public protocol SigninDependency: Dependency {}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
