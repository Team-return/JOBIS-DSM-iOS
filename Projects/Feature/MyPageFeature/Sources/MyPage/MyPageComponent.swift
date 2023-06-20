import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import StudentsDomainInterface

public protocol MyPageDependency: Dependency {
    var fetchStudentInfoUseCase: any FetchStudentInfoUseCase { get }
    var reportFactory: any ReportFactory { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(fetchStudentInfoUseCase: dependency.fetchStudentInfoUseCase),
            reportFactory: dependency.reportFactory
        )
    }
}
