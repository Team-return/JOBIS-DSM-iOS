import DesignSystem
import SwiftUI

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel

    init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
