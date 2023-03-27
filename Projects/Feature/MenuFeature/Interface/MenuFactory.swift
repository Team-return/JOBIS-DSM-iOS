import SwiftUI

public protocol MenuFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
