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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.Main.darkBlue, .Main.lightBlue, .Main.lightBlue]),
                           startPoint: .top, endPoint: .bottom)
            VStack {
                Text("signin")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
