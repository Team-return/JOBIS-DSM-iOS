import DesignSystem
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    init(
        viewModel: HomeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Home")
    }
}
