import SwiftUI
import ReviewsDomainInterface
import CodesDomainInterface
import NeedleFoundation
import PostReviewFeatureInterface

public protocol PostReviewDependency: Dependency {
    var fetchCodesUseCase: any FetchCodesUseCase { get }
    var postReviewUseCase: any PostReviewUseCase { get }
}

public final class PostReviewComponent: Component<PostReviewDependency>, PostReviewFactory {
    public func makeView(companyID: Int) -> some View {
        PostReviewView(
            viewModel: .init(
                fetchCodesUseCase: dependency.fetchCodesUseCase,
                postReviewUseCase: dependency.postReviewUseCase
            ),
            companyID: companyID
        )
    }
}
