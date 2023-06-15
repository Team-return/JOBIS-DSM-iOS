import SwiftUI

public protocol RecruitmentDetailFactory {
    associatedtype SomeView: View
    func makeView(id: String, isDetail: Bool) -> SomeView
}
