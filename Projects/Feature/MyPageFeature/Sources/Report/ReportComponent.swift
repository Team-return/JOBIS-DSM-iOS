import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol ReportDependency: Dependency {}

public final class ReportComponent: Component<ReportDependency>, ReportFactory {
    public func makeView() -> some View {
        ReportView(viewModel: .init())
    }
}
