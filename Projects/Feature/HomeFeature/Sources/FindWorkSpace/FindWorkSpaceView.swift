import DesignSystem
import SwiftUI

struct FindWorkSpaceView: View {
    @StateObject var viewModel: FindWorkSpaceViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: FindWorkSpaceViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let list = viewModel.studentCompany {
                ScrollView {
                    ForEach(list.companies, id: \.self) { companyEntity in
                        NavigationLink(destination: Text(companyEntity.name)) {
                            FindWorkSpaceListCell(companyEntity: companyEntity)
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
