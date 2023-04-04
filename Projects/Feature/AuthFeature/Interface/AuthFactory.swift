import SwiftUI

public protocol AuthFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
