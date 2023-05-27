import SwiftUI
import HomeFeatureInterface
import CompaniesDomainInterface
import NeedleFoundation

public protocol FindCompanyDependency: Dependency {
    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase { get }
}

public final class FindCompanyComponent: Component<FindWorkSpaceDependency>, FindCompanyFactory {
    public func makeView() -> some View {
        FindCompanyView(
            viewModel: .init(
                fetchStudentCompanyListUseCase: dependency.fetchStudentCompanyListUseCase
            )
        )
    }
}
