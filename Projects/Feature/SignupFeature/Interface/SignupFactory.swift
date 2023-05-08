import SwiftUI

public protocol SignupFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
