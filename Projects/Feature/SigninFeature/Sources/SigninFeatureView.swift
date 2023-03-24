import DesignSystem
import SwiftUI

struct SigninFeatureView: View {
    @StateObject var viewModel: SigninFeatureViewModel

    init(
        viewModel: SigninFeatureViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
