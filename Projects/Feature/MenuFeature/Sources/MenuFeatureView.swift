import DesignSystem
import SwiftUI

struct MenuFeatureView: View {
    @StateObject var viewModel: MenuFeatureViewModel

    init(
        viewModel: MenuFeatureViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
