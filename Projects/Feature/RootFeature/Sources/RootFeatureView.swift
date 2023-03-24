import DesignSystem
import SwiftUI

struct RootFeatureView: View {
    @StateObject var viewModel: RootFeatureViewModel

    init(
        viewModel: RootFeatureViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
