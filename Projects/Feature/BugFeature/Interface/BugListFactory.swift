import SwiftUI

public protocol BugListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
