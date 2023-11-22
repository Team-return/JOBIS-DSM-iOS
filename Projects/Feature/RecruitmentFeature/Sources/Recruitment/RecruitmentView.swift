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
        ScrollView {
            LazyVStack {
                searchBar()

                let recruitments = viewModel.recruitmentList.recruitments
                if !recruitments.isEmpty {
                    ForEach(0..<recruitments.count, id: \.self) { index in
                        Button {
                            viewModel.isNavigateRecruitmentDetail.toggle()
                        } label: {
                            RecruitmentListCell(
                                recruitmentEntity: recruitments[index],
                                recruitmentDetailFactory: recruitmentDetailFactory
                            ) {
                                viewModel.recruitmentList.recruitments[index].bookmarked.toggle()
                                viewModel.bookmark(id: recruitments[index].recruitID)
                            }
                        }
                        .onAppear {
                            viewModel.appendRecruitmentList(list: recruitments[index])
                        }
                    }
                } else {
                    Group {
                        if viewModel.isLoading {
                            ProgressView().progressViewStyle(.circular)
                        } else {
                            Text("모집의뢰서가 없어요. ❌")
                                .JOBISFont(.heading(.heading6), color: .Sub.gray90)
                        }
                    }
                    .padding(.vertical, 100)
                }
            }
            .padding(.horizontal, 24)
        }
        .refreshable {
            viewModel.onAppear()
        }
        .onLoad {
            viewModel.onAppear()
        }
        .hideKeyboardWhenTap()
        .navigationTitle((viewModel.winterIntern ? "겨울인턴": "모집의뢰서") + " 조회하기")
        .sheet(isPresented: $viewModel.isShowFilterSheet) {
            viewModel.fetchRecruitment()
        } content: {
            RecruitmentFilterSheet(viewModel: viewModel)
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

                if !viewModel.selectedTechCode.isEmpty || viewModel.selectedJobCode != nil {
                    Text("필터 적용됨")
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)
                }
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}
