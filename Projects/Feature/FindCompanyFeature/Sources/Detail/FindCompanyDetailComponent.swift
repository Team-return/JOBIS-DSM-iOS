import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import ReviewsDomainInterface
import NeedleFoundation

public protocol FindCompanyDetailDependency: Dependency {
    var fetchCompanyInfoDetailUseCase: any FetchCompanyInfoDetailUseCase { get }
    var fetchReviewListUseCase: any FetchReviewListUseCase { get }
}

public final class FindCompanyDetailComponent: Component<FindCompanyDetailDependency>, FindCompanyDetailFactory {
    public func makeView(id: String) -> some View {
        FindCompanyDetailView(
            viewModel: .init(
                fetchCompanyInfoDetailUseCase: dependency.fetchCompanyInfoDetailUseCase,
                fetchReviewListUseCase: dependency.fetchReviewListUseCase,
                id: id
            )
        )
    }
}
