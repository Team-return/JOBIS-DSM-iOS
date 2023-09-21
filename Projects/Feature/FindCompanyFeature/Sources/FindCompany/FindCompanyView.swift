import DesignSystem
import CompaniesDomainInterface
import SwiftUI
import UtilityModule
import FindCompanyFeatureInterface

struct FindCompanyView: View {
    @StateObject var viewModel: FindCompanyViewModel
    @Environment(\.dismiss) var dismiss
    private let listCellEdgeInset = EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 0)

    private let findCompanyDetailFactory: any FindCompanyDetailFactory

    init(
        viewModel: FindCompanyViewModel,
        findCompanyDetailFactory: any FindCompanyDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findCompanyDetailFactory = findCompanyDetailFactory
    }

    var body: some View {
        ScrollView {
            Group {
                searchBar()

                if let list = viewModel.studentCompanyList {
                    ForEach(list.companies, id: \.self) { companyEntity in
                        navigateToFindCompanyDetail(companyEntity: companyEntity)
                    }
                } else {
                    ProgressView().progressViewStyle(.circular)
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
        .navigationTitle("기업 조회하기")
    }

    @ViewBuilder
    func searchBar() -> some View {
        VStack(alignment: .leading) {
            SearchJOBISFormTextField(
                "회사명을 입력해주세요.",
                text: $viewModel.companyText
            ) {
                viewModel.onAppear()
            }

            if !viewModel.filteringName.isEmpty {
                Text("검색결과 : ")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)

                Text(viewModel.filteringName)
                    .JOBISFont(.etc(.caption), color: .Sub.gray90)
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }

    @ViewBuilder
    func navigateToFindCompanyDetail(companyEntity: CompanyEntity) -> some View {
        FindCompanyListCell(
            companyEntity: companyEntity,
            findCompanyDetailFactory: findCompanyDetailFactory
        )
        .onAppear {
            viewModel.appendFindCompanyList(list: companyEntity)
        }
    }
}
