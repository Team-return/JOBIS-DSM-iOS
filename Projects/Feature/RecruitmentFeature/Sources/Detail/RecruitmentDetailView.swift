import DesignSystem
import RecruitmentsDomainInterface
import FindCompanyFeatureInterface
import SwiftUI
import UtilityModule
import Kingfisher

struct RecruitmentDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RecruitmentDetailViewModel
    private let isDetail: Bool

    private let findCompanyDetailFactory: any FindCompanyDetailFactory

    init(
        viewModel: RecruitmentDetailViewModel,
        findCompanyDetailFactory: any FindCompanyDetailFactory,
        isDetail: Bool
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findCompanyDetailFactory = findCompanyDetailFactory
        self.isDetail = isDetail
    }

    var body: some View {
        ZStack {
            if let detailInfo = viewModel.recruitmentDetail {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 12) {
                            URLImage(imageURL: detailInfo.companyProfileUrl, shape: .square(80))
                                .cornerRadius(15)

                            Text(detailInfo.companyName)
                                .JOBISFont(.body(.body1), color: .Sub.gray90)
                        }
                        .padding(.bottom, 2)

                        if !isDetail {
                            GrayBtn(text: "기업 보기", size: .large) {
                                viewModel.isNavigateCompanyDetail.toggle()
                            }
                            .navigate(
                                to: findCompanyDetailFactory.makeView(
                                    id: String(detailInfo.companyID),
                                    isDetail: true
                                ).eraseToAnyView(),
                                when: $viewModel.isNavigateCompanyDetail
                            )
                        }

                        Divider()
                            .foregroundColor(.Sub.gray40)

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
                    }
                    .padding(.bottom, 100)
                    .padding(.horizontal, 20)
                }

                VStack {
                    Spacer()

                    SolidBtn(text: "지원하기", size: .large) {
                        viewModel.isTappedApplyButton.toggle()
                    }
                }
                .padding(.horizontal, 20)

                Color.black
                    .opacity(viewModel.isTappedApplyButton ? 0.2 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.isTappedApplyButton.toggle()
                    }

                ApplySheet(
                    urls: $viewModel.urls,
                    documents: $viewModel.documents,
                    submitDoc: detailInfo.submitDocument
                ) {
                    viewModel.apply {
                        viewModel.isTappedApplyButton.toggle()
                    }
                }
                .opacity(viewModel.isTappedApplyButton ? 1 : 0)
            } else {
                ProgressView().progressViewStyle(.circular)
                    .frame(maxHeight: .infinity)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onLoad {
            viewModel.onAppear()
        }
        .jobisToast(
            isShowing: $viewModel.isErrorOcuured,
            message: viewModel.errorMessage,
            style: .error,
            title: "지원 불가"
        )
        .jobisToast(
            isShowing: $viewModel.isSuccessApply,
            message: "성공적으로 지원되셨습니다.",
            style: .success,
            title: "지원 성공"
        )
        .animation(.easeIn(duration: 0.1), value: viewModel.isTappedApplyButton)
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
