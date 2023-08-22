import SwiftUI
import NeedleFoundation
import PostReviewFeatureInterface

public protocol PostReviewDependency: Dependency {}

public final class PostReviewComponent: Component<PostReviewDependency>, PostReviewFactory {
    
    public func makeView() -> some View {
        PostReviewView(viewModel: .init())
    }
}

