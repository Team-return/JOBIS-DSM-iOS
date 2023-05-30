import DesignSystem
import SwiftUI
import FindCompanyFeatureInterface

struct FindCompanyView: View {
    @StateObject var viewModel: FindCompanyViewModel
    @Environment(\.dismiss) var dismiss

    private let findCompanyDetailFactory: any FindCompanyDetailFactory

    init(
        viewModel: FindCompanyViewModel,
        findCompanyDetailFactory: any FindCompanyDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findCompanyDetailFactory = findCompanyDetailFactory
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let list = viewModel.studentCompanyList {
                List(list.companies, id: \.self) { companyEntity in
                    Button {
                        viewModel.isNavigateCompanyDetail.toggle()
                    } label: {
                        FindCompanyListCell(
                            companyEntity: companyEntity,
                            findCompanyDetailFactory: findCompanyDetailFactory
                        )
                    }
                    .onAppear {
                        viewModel.appendFindCompanyList(list: companyEntity)
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
        .jobisBackButton(title: "기업 조회하기") { dismiss() }
    }
}
