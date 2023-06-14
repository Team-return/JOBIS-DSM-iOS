import DesignSystem
import RecruitmentsDomainInterface
import SwiftUI
import Kingfisher

struct RecruitmentDetailView: View {
    @StateObject var viewModel: RecruitmentDetailViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: RecruitmentDetailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            if let detailInfo = viewModel.recruitmentDetail {
                LazyVStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        KFImage(URL(string: detailInfo.companyProfileUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)

                        Text(detailInfo.companyName)
                            .JOBISFont(.body(.body1), color: .Sub.gray90)
                    }
                    .padding(.bottom, 2)

                    GrayBtn(text: "기업 보기", size: .large) {
                        print("기업 보기")
                    }

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    recruitmentInfo(detailInfo: detailInfo)
                }
                .padding(.horizontal, 24)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .jobisBackButton(title: "모집의뢰서 상세보기") {
            dismiss()
        }
    }

    @ViewBuilder
    func recruitmentInfo(detailInfo: RecruitmentDetailEntity) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            recruitmentInfoCell(
                title: "모집기간",
                content: detailInfo.startDate + " ~ " + detailInfo.endDate
            )

            areaView(areas: detailInfo.areas)

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
