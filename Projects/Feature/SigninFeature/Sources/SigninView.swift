import DesignSystem
import SwiftUI

struct SigninView: View {
    @StateObject var viewModel: SigninViewModel

    init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Signin")
    }
}
