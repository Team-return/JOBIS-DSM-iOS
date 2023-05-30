import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import NeedleFoundation

public protocol FindCompanyDependency: Dependency {
    var fetchStudentCompanyListUseCase: any FetchStudentCompanyListUseCase { get }
    var findCompanyDetailFactory: any FindCompanyDetailFactory { get }
}

public final class FindCompanyComponent: Component<FindCompanyDependency>, FindCompanyFactory {
    public func makeView() -> some View {
        FindCompanyView(
            viewModel: .init(
                fetchStudentCompanyListUseCase: dependency.fetchStudentCompanyListUseCase),
            findCompanyDetailFactory: dependency.findCompanyDetailFactory
        )
    }
}
