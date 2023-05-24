import SwiftUI
import HomeFeatureInterface
import CompaniesDomainInterface
import NeedleFoundation

public protocol FindWorkSpaceDependency: Dependency {
    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase { get }
}

public final class FindWorkSpaceComponent: Component<FindWorkSpaceDependency>, FindWorkSpaceFactory {
    public func makeView() -> some View {
        FindWorkSpaceView(
            viewModel: .init(fetchStudentCompanyListUseCase: dependency.fetchStudentCompanyListUseCase)
        )
    }
}
