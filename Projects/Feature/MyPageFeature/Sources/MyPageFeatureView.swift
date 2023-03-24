import DesignSystem
import SwiftUI

struct MyPageFeatureView: View {
    @StateObject var viewModel: MyPageFeatureViewModel

    init(
        viewModel: MyPageFeatureViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
