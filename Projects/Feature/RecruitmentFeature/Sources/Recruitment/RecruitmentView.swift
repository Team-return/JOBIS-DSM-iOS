import DesignSystem
import RecruitmentFeatureInterface
import SwiftUI

struct RecruitmentView: View {
    @StateObject var viewModel: RecruitmentViewModel
    @Environment(\.dismiss) var dismiss

    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        viewModel: RecruitmentViewModel,
        recruitmentDetailFactory: any RecruitmentDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentDetailFactory = recruitmentDetailFactory
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let list = viewModel.recruitmentList {
                List(list.recruitments, id: \.self) { recruitmentEntity in
                    Button {
                        viewModel.isNavigateRecruitmentDetail.toggle()
                    } label: {
                        RecruitmentListCell(
                            recruitmentEntity: recruitmentEntity,
                            recruitmentDetailFactory: recruitmentDetailFactory
                        ) {
                            viewModel.bookmark(id: recruitmentEntity.recruitID)
                        }
                    }
                    .onAppear {
                        viewModel.appendRecruitmentList(list: recruitmentEntity)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(.init(top: 7, leading: 0, bottom: 7, trailing: 0)))
                }
                .listStyle(.plain)
                .listSectionSeparator(.hidden)
                .refreshable {
                    viewModel.onAppear()
                }
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .jobisBackButton(title: "모집의뢰서 조회하기") { dismiss() }
    }

    @ViewBuilder
    func searchBar() -> some View {
        VStack {
            HStack {
                JOBISTextField(
                    placeholder: "회사명을 입력해주세요.",
                    text: $viewModel.companyText,
                    inputType: .search,
                    outlinedType: .outlined
                ) {
                    viewModel.fetchRecruitment()
                }

                SolidBtn(
                    text: "",
                    style: .icon1,
                    size: .small,
                    icon: JOBISImage(.filterIcon).jobisImageToImage(),
                    iconWidth: 24,
                    iconHeight: 24
                ) {
                    print("번쩍ㅂ번쩍")
                }
            }

            HStack(spacing: 0) {
                if !viewModel.filteringName.isEmpty {
                    Text("검색결과 : ")
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Text(viewModel.filteringName)
                        .JOBISFont(.etc(.caption), color: .Sub.gray90)
                }

                Spacer()

                Text("필터 적용됨")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }

    @ViewBuilder
    func navigateToRecruitmentDetail(recruitmentEntity: RecruitmentEntity) -> some View {
        Button {
            viewModel.isNavigateRecruitmentDetail.toggle()
        } label: {
            RecruitmentListCell(
                recruitmentEntity: recruitmentEntity,
                recruitmentDetailFactory: recruitmentDetailFactory
            ) {
                viewModel.bookmark(id: recruitmentEntity.recruitID)
            }
        }
        .onAppear {
            viewModel.appendRecruitmentList(list: recruitmentEntity)
        }
    }
}
