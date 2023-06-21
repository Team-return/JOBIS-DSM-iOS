import DesignSystem
import SwiftUI
import Kingfisher
import RecruitmentFeatureInterface
import UtilityModule

struct FindCompanyDetailView: View {
    @StateObject var viewModel: FindCompanyDetailViewModel
    @State private var isShowDetail = false
    private let isDetail: Bool

    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        viewModel: FindCompanyDetailViewModel,
        recruitmentDetailFactory: any RecruitmentDetailFactory,
        isDetail: Bool
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentDetailFactory = recruitmentDetailFactory
        self.isDetail = isDetail
    }

    var body: some View {
        ScrollView {
            if let infoDetail = viewModel.companyInfoDetail {
                LazyVStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        KFImage(URL(string: infoDetail.companyProfileURL))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)

                        Text(infoDetail.companyName)
                            .JOBISFont(.body(.body1), color: .Sub.gray90)
                    }
                    .padding(.bottom, 2)

                    companyIntroduce(introduce: infoDetail.companyIntroduce)

                    if let recruitmentID = infoDetail.recruitmentID, !isDetail {
                        GrayBtn(text: "모집의뢰서 보기", size: .large) {
                            viewModel.isSheetRecruitmentDetail.toggle()
                        }
                        .sheet(isPresented: $viewModel.isSheetRecruitmentDetail) {
                            recruitmentDetailFactory.makeView(
                                id: String(recruitmentID),
                                isDetail: true
                            ).eraseToAnyView()
                        }
                    }

                    Divider()
                        .foregroundColor(.Sub.gray40)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(zip(viewModel.titles, viewModel.contents)), id: \.0) { title, content in
                            companyInfo(title: title, content: content)
                        }
                    }
                    .padding(.vertical, 10)

                    if let reviewList = viewModel.reviewList, !reviewList.reviews.isEmpty {
                        Divider()
                        .foregroundColor(.Sub.gray40)

                        Text("면접 후기")
                        .JOBISFont(.body(.body2), color: .Sub.gray70)

                        ForEach(reviewList.reviews, id: \.self) { review in
                            reviewCell(title: review.writer, date: review.createdDate)
                        }
                    }
                }
                .padding([.horizontal, .top], 24)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func companyInfo(title: String, content: String) -> some View {
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
    func reviewCell(title: String, date: String) -> some View {
        HStack {
            Text(title + "의 후기")
                .JOBISFont(.etc(.caption), color: .Sub.gray90)

            Spacer()

            Text(date)
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Color.Sub.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.Sub.gray40)
        )
    }

    @ViewBuilder
    func companyIntroduce(introduce: String) -> some View {
        VStack(spacing: 5) {
            Text(introduce)
                .lineLimit(
                    isShowDetail ? nil : introduce.count > 200 ? 3 : nil
                )
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            if introduce.count > 200 {
                Text(isShowDetail ? "간략히" : "자세히")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
                    .underlineText(color: .Sub.gray60)
                    .onTapGesture {
                        withAnimation(
                            .spring(
                                response: 0.6, dampingFraction: 0.8, blendDuration: 1.0
                            )
                        ) {
                            isShowDetail.toggle()
                        }
                    }
            }
        }
    }
}
