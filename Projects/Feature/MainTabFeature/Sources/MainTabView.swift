import DesignSystem
import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel: MainTabViewModel

    init(
        viewModel: MainTabViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("MainTab")
    }
}
