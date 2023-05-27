import SwiftUI

public protocol FindWorkSpaceFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
