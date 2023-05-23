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
                    RecruitmentListCell(recruitmentEntity: recruitmentEntity)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 7, leading: 24, bottom: 7, trailing: 24))
                }
                .listRowBackground(Color.clear)
                .listStyle(.plain)
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
}
