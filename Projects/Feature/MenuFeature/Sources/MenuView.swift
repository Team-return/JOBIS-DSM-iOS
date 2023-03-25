import DesignSystem
import SwiftUI

struct MenuView: View {
    @StateObject var viewModel: MenuViewModel

    init(
        viewModel: MenuViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
