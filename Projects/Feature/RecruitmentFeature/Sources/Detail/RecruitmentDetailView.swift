import DesignSystem
import RecruitmentsDomainInterface
import SwiftUI
import Kingfisher

struct RecruitmentDetailView: View {
    @StateObject var viewModel: RecruitmentDetailViewModel
    let profileURL: String
    let companyName: String

    init(
        viewModel: RecruitmentDetailViewModel,
        profileURL: String,
        companyName: String
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.profileURL = profileURL
        self.companyName = companyName
    }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 12) {
                    KFImage(URL(string: profileURL))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(15)

                    Text(companyName)
                        .JOBISFont(.body(.body1), color: .Sub.gray90)
                }
                .padding(.bottom, 2)

                GrayBtn(text: "기업 보기", size: .large) {
                    print("기업 보기")
                }

                Divider()
                    .foregroundColor(.Sub.gray40)

                recruitmentInfo()
            }
            .padding([.horizontal, .top], 24)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func recruitmentInfo() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let detailInfo = viewModel.recruitmentDetail {
                recruitmentInfoCell(
                    title: "모집기간",
                    content: detailInfo.startDate + " ~ " + detailInfo.endDate
                )

                areaView(areas: detailInfo.areas)
            }

            ForEach(Array(zip(viewModel.titles, viewModel.contents)), id: \.0) { title, content in
                recruitmentInfoCell(title: title, content: content)
            }
        }
        .padding(.vertical, 10)
    }

    @ViewBuilder
    func recruitmentInfoCell(title: String, content: String) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text(title)
                .JOBISFont(.etc(.caption), color: .Sub.gray70)
                .frame(width: 76, alignment: .leading)

            Text(content)
                .multilineTextAlignment(.leading)
                .JOBISFont(.etc(.caption), color: .Sub.gray90)
        }
    }

    @ViewBuilder
    func areaView(areas: [AreaEntity]) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text("모집분야")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)
                .frame(width: 76, alignment: .leading)

            VStack {
                ForEach(areas, id: \.self) { area in
                    AreaCell(area: area)
                }
            }
        }
    }
}
