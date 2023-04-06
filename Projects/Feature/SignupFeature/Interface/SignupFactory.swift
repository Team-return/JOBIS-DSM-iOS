import SwiftUI

public protocol SignupFactory {
    associatedtype SomeView: View
    func makeView(
        signupAnimation: Namespace.ID,
        isPresented: Binding<Bool>
    ) -> SomeView
}
