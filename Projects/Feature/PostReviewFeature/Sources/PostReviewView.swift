import DesignSystem
import SwiftUI

struct PostReviewView: View {
    @StateObject var viewModel: PostReviewViewModel

    init(
        viewModel: PostReviewViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
