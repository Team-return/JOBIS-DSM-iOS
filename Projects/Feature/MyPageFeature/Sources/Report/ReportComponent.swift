import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface
import BugsDomainInterface
import FilesDomainInterface

public protocol ReportDependency: Dependency {
    var reportBugsUseCase: any ReportBugsUseCase { get }
    var uploadFilesUseCase: any UploadFilesUseCase { get }
}

public final class ReportComponent: Component<ReportDependency>, ReportFactory {
    public func makeView() -> some View {
        ReportView(
            viewModel: .init(
                reportBugsUseCase: dependency.reportBugsUseCase,
                uploadFilesUseCase: dependency.uploadFilesUseCase
            )
        )
    }
}
