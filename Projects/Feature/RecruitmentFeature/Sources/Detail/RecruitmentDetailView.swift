import DesignSystem
import RecruitmentsDomainInterface
import FindCompanyFeatureInterface
import SwiftUI
import UtilityModule
import Kingfisher

struct RecruitmentDetailView: View {
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
        if let detailInfo = viewModel.recruitmentDetail {
            ZStack {
                ScrollView {
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

                        if !isDetail {
                            GrayBtn(text: "기업 보기", size: .large) {
                                viewModel.isSheetCompanyDetail.toggle()
                            }
                            .sheet(isPresented: $viewModel.isSheetCompanyDetail) {
                                findCompanyDetailFactory.makeView(
                                    id: String(detailInfo.companyID),
                                    isDetail: true
                                ).eraseToAnyView()
                            }
                        }

                        Divider()
                            .foregroundColor(.Sub.gray40)

                        recruitmentInfo(detailInfo: detailInfo)
                    }
                    .padding(.vertical, 24)
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 20)

                VStack {
                    Spacer()

                    SolidBtn(text: "지원하기", size: .large) {
                        withAnimation(.easeIn(duration: 0.1)) {
                            viewModel.isTappedApplyButton.toggle()
                        }
                    }
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 20)

                Color.black
                    .opacity(viewModel.isTappedApplyButton ? 0.2 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            viewModel.isTappedApplyButton.toggle()
                        }
                    }

                ApplySheet(urls: $viewModel.urls, submitDoc: detailInfo.submitDocument) {
                    print("지원!")
                    print(viewModel.urls.joined(separator: ", "))
                }
                .opacity(viewModel.isTappedApplyButton ? 1 : 0)
            }
            .onAppear {
                viewModel.onAppear()
            }
        } else {
            ProgressView().progressViewStyle(.circular)
                .frame(maxHeight: .infinity)
                .onAppear {
                    viewModel.onAppear()
                }
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
