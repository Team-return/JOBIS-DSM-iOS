import DesignSystem
import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel

    init(
        viewModel: RootViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Root")
    }
}
