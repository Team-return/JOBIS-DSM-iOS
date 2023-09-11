import SwiftUI
import BugsDomainInterface
import BugFeatureInterface
import NeedleFoundation

public protocol BugListDependency: Dependency {
    var fetchBugListUseCase: any FetchBugListUseCase { get }
    var fetchBugDetailUseCase: any FetchBugDetailUseCase { get }
}

public final class BugListComponent: Component<BugListDependency>, BugListFactory {
    public func makeView() -> some View {
        BugListView(
            viewModel: .init(
                fetchBugListUseCase: dependency.fetchBugListUseCase,
                fetchBugDetailUseCase: dependency.fetchBugDetailUseCase
            )
        )
    }
}
