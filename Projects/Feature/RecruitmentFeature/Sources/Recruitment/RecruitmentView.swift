import DesignSystem
import RecruitmentsDomainInterface
import RecruitmentFeatureInterface
import UtilityModule
import SwiftUI

struct RecruitmentView: View {
    @StateObject var viewModel: RecruitmentViewModel
    @Environment(\.dismiss) var dismiss
    private let listCellEdgeInset = EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 0)

    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        viewModel: RecruitmentViewModel,
        recruitmentDetailFactory: any RecruitmentDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentDetailFactory = recruitmentDetailFactory
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                List {
                    searchBar()

                    if let list = viewModel.recruitmentList {
                        ForEach(list.recruitments, id: \.self) { recruitmentEntity in
                            navigateToRecruitmentDetail(recruitmentEntity: recruitmentEntity)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(listCellEdgeInset)
                    }
                }
                .listStyle(.plain)
                .listSectionSeparator(.hidden)
                .refreshable {
                    viewModel.onAppear()
                }
            }

            if viewModel.isLoading {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .hideKeyboardWhenTap()
        .navigationTitle("모집의뢰서 조회하기")
        .sheet(isPresented: $viewModel.isShowFilterSheet) {
            viewModel.fetchRecruitment()
        } content: {
            RecruitmentFilterSheet(viewModel: viewModel)
//                .presentationDragIndicator(.visible)
        }
    }

    @ViewBuilder
    func searchBar() -> some View {
        VStack {
            HStack {
                SearchJOBISFormTextField(
                    "회사명을 입력해주세요.",
                    text: $viewModel.companyText
                ) {
                    viewModel.fetchRecruitment()
                }

                SolidBtn(
                    text: "",
                    style: .icon1,
                    size: .small,
                    icon: JOBISIcon(.filterIcon).jobisIconToImage(),
                    iconWidth: 24,
                    iconHeight: 24
                ) {
                    viewModel.isShowFilterSheet.toggle()
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

                if !viewModel.selectedTechCode.isEmpty {
                    Text("필터 적용됨")
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)
                }
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
