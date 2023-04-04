import SwiftUI

public protocol SigninFactory {
    associatedtype SomeView: View
    func makeView(
        signinAnimation: Namespace.ID,
        isPresented: Binding<Bool>
    ) -> SomeView
}
