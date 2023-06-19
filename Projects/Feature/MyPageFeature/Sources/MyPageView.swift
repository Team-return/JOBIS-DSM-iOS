import DesignSystem
import SwiftUI
import UtilityModule
import Kingfisher

struct MyPageView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: MyPageViewModel

    init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Divider().foregroundColor(.Sub.gray40)
                    .padding(.bottom, 50)

                KFImage(URL(string: ""))
                    .placeholder { Color.gray }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 62, height: 62)
                    .clipShape(Circle())
                    .padding(.bottom, 5)

                Text("강용수")
                    .JOBISFont(.heading(.heading6), color: .Sub.gray90)

                Text("임베디드소프트웨어개발과")
                    .JOBISFont(.body(.body2), color: .Sub.gray90)

                Text("2학년 3반 2번")
                    .JOBISFont(.body(.body4), color: .Sub.gray70)
                    .padding(.bottom, 15)

                Text("백엔드")
                    .JOBISFont(.body(.body4), color: .Sub.gray10)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .background(Color.Main.lightBlue)
                    .cornerRadius(15)
                    .padding(.bottom, 35)

                VStack(alignment: .leading, spacing: 15) {
                    Divider().foregroundColor(.Sub.gray40)

                    Text("버그 제보하기")
                        .JOBISFont(.etc(.caption), color: .Main.lightBlue)

                    Divider().foregroundColor(.Sub.gray40)

                    Text("관심분야 선택하기")
                        .JOBISFont(.etc(.caption), color: .Main.lightBlue)

                    Divider().foregroundColor(.Sub.gray40)

                    Text("비밀번호 변경하기")
                        .JOBISFont(.etc(.caption), color: .Main.lightBlue)

                    Divider().foregroundColor(.Sub.gray40)

                    Text("로그아웃")
                        .JOBISFont(.etc(.caption), color: .State.error)

                    Divider().foregroundColor(.Sub.gray40)
                }
            }
            .padding(.horizontal, 25)
        }
        .onChange(of: viewModel.isTabbarHidden) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .navigationTitle("마이페이지")
    }
}
