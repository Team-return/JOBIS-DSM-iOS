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
