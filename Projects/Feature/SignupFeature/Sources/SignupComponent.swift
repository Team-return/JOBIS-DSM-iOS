import SwiftUI
import NeedleFoundation

public protocol SignupDependency: Dependency {}

public final class SignupComponent: Component<SignupDependency>, SignupFactory {
    public func makeView() -> some View {
        Text("Text")
    }
}
