import SwiftUI

public protocol RootFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
