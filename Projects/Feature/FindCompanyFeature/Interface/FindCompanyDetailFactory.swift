import SwiftUI

public protocol FindCompanyDetailFactory {
    associatedtype SomeView: View
    func makeView(id: String) -> SomeView
}
