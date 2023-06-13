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
                    searchBar()
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

    @ViewBuilder
    func searchBar() -> some View {
        VStack(alignment: .leading) {
            JOBISTextField(
                placeholder: "회사명을 입력해주세요.",
                text: $viewModel.companyText,
                inputType: .search,
                outlinedType: .outlined
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

}
