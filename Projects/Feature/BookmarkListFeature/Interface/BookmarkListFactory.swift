import SwiftUI

public protocol BookmarkListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
