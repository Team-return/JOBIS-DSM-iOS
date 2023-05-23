import SwiftUI

public protocol RecruitmentFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
