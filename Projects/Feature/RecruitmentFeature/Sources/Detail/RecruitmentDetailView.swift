import DesignSystem
import RecruitmentsDomainInterface
import SwiftUI
import Kingfisher

struct RecruitmentDetailView: View {
    @StateObject var viewModel: RecruitmentDetailViewModel

    init(
        viewModel: RecruitmentDetailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            if let recruitmentDetail = viewModel.recruitmentDetail {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        KFImage(URL(string: "ㅁㅁㄴㅇㄹ"))
                            .placeholder({
                                Color.Sub.gray40
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)

                        Text("대충 회사이름")
                            .JOBISFont(.body(.body1), color: .Sub.gray90)
                    }
                    .padding(.bottom, 2)

                    GrayBtn(text: "기업 보기") {
                        print("기업보기")
                    }

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(zip(viewModel.titles, viewModel.contents)), id: \.0) { title, content in
                            recruitmentInfo(title: title, content: content)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .padding([.horizontal, .top], 24)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func recruitmentInfo(title: String, content: String) -> some View {
        HStack(spacing: 0) {
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
        HStack(spacing: 0) {
            Text("모집분야")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)
                .frame(width: 76, alignment: .leading)

            VStack {
                ForEach(areas, id: \.self) { area in
                    areaCell(area: area)
                }
            }
        }
    }

    @ViewBuilder
    func areaCell(area: AreaEntity) -> some View {
        VStack {
            HStack {
                Text(area.job)
                    .JOBISFont(.body(.body3), color: .Sub.gray90)

                Spacer()

                Text(String(area.hiring))
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }

            Text("리액트를 이용한 프론트 개발")
                .JOBISFont(.etc(.caption), color: .Sub.gray90)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.Sub.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.Sub.gray40)
        )
    }
}
