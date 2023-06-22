import SwiftUI

public protocol ReportFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
