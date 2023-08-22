import SwiftUI

public protocol PostReviewFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
