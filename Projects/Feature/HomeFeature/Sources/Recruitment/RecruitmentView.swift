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
                ScrollView {
                    ForEach(list.recruitments, id: \.self) { recruitmentEntity in
                        NavigationLink(destination: Text(recruitmentEntity.companyName)) {
                            RecruitmentListCell(recruitmentEntity: recruitmentEntity)
                        }
                    }
                }
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
