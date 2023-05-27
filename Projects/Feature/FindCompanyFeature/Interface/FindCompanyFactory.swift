import SwiftUI

public protocol FindCompanyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
