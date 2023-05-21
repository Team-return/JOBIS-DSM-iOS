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
        GeometryReader { proxy in
            ZStack {
                Color.Sub.gray10.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    ImploymentPersentView()
                        .padding(.bottom, 40)

                    StudentInfoView()

                    ApplicationStatusView()

                    Spacer()

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    HStack(spacing: 12) {
                        navigateButton(
                            text: "모집의뢰서\n조회하기",
                            image: HomeImage(.recruitment)
                        ) {
                            Text("모집의뢰서")
                        }
                        .frame(width: proxy.size.width / 2)

                        navigateButton(
                            text: "기업찾기\n",
                            image: HomeImage(.findWorkspace)
                        ) {
                            Text("기업 찾기")
                        }
                    }
                    .padding(22)
                    .padding(.bottom, 10)
                    .background(Color.Sub.gray20)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    @ViewBuilder
    func navigateButton(
        text: String,
        image: HomeImage,
        toWhere: () -> some View
    ) -> some View {
        NavigationLink(destination: toWhere) {
            VStack {
                HStack {
                    Text(text)
                        .JOBISFont(.body(.body1), color: .Sub.gray80)

                    Spacer()
                }
                .padding(.top, 22)
                .padding(.leading, 24)

                HStack {
                    Spacer()

                    image
                        .frame(width: 96, height: 96)
                }
                .padding(.bottom, 8)
                .padding(.trailing, 7)
            }
            .background(Color.Sub.gray10)
            .cornerRadius(10)
            .shadow(opacity: 0.1, y: 1, blur: 10)
        }
    }
}
