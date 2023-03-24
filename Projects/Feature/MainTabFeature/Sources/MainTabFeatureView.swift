import DesignSystem
import SwiftUI

struct MainTabFeatureView: View {
    @StateObject var viewModel: MainTabFeatureViewModel

    init(
        viewModel: MainTabFeatureViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
