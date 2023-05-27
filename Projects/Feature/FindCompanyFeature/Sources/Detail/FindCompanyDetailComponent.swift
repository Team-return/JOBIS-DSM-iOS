import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import NeedleFoundation

public protocol FindCompanyDetailDependency: Dependency {
    var fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase { get }
}

public final class FindCompanyDetailComponent: Component<FindCompanyDetailDependency>, FindCompanyDetailFactory {
    public func makeView(id: String) -> some View {
        FindCompanyDetailView(
            viewModel: .init(fetchCompanyInfoDetailUseCase: dependency.fetchCompanyInfoDetailUseCase, id: id)
        )
    }
}
