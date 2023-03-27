import DesignSystem
import SwiftUI

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel

    init(
        viewModel: SplashViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
