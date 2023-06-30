import SwiftUI

public protocol RenewalPasswordFactory {
    associatedtype SomeView: View
    func makeView(email: String) -> SomeView
}
