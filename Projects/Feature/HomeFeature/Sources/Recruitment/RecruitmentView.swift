import DesignSystem
import SwiftUI

struct RecruitmentView: View {
    @StateObject var viewModel: RecruitmentViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: RecruitmentViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let list = viewModel.recruitmentList {
                List(list.recruitments, id: \.self) { recruitmentEntity in
                    Button {
                        viewModel.isNavigateRecruitmentDetail.toggle()
                    } label: {
                        RecruitmentListCell(recruitmentEntity: recruitmentEntity)
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
        .navigate(to: Text("모집의뢰서 Detail"), when: $viewModel.isNavigateRecruitmentDetail)
    }
}
