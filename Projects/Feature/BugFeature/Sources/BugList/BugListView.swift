import DesignSystem
import BugsDomainInterface
import SwiftUI
import UtilityModule

struct BugListView: View {
    @StateObject var viewModel: BugListViewModel

    init(
        viewModel: BugListViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if let bugList = viewModel.bugList?.bugReports {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(bugList, id: \.self) { bug in
                            bugLiseCell(bug: bug)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            } else {
                VStack {
                    Spacer()

                    if viewModel.isLoading {
                        ProgressView().progressViewStyle(.circular)
                    } else {
                        Text("버그가 없어요.")
                        .JOBISFont(.body(.body1), color: .Sub.gray90)
                    }

                    Spacer()
                }
            }
        }
        .background(Color.Sub.gray10)
        .padding(.top, 20)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("버그함")
        .navigationBarItems(trailing: majorPicker())
        .onChange(of: viewModel.selectedDepartment) { _ in
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func majorPicker() -> some View {
        Menu {
            ForEach(viewModel.devMajors, id: \.self) { major in
                Button {
                    viewModel.selectedDepartment = major
                } label: {
                    HStack {
                        Text(major.localizedString())

                        if viewModel.selectedDepartment == major {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5) {
                Spacer()

                Text(viewModel.selectedDepartment.localizedString())

                JOBISIcon(.chevronDown)
                    .frame(width: 16, height: 16)
            }
            .frame(width: 75)
        }
        .menuStyle(BorderlessButtonMenuStyle())
    }

    @ViewBuilder
    func bugLiseCell(bug: BugReportEntity) -> some View {
        NavigationLink {
            BugDetailView(bugDetail: viewModel.bugDetail)
                .onAppear { viewModel.fetchBugDetail(id: bug.id) }
                .onDisappear { viewModel.bugDetail = nil}
        } label: {
            HStack {
                bug.developmentArea.developIcon()
                    .frame(width: 16, height: 16)

                Text(bug.title)
                    .JOBISFont(.body(.body4), color: .Sub.gray90)

                Spacer()

                Text(bug.createdAt.toJOBISDate().toDotsString())
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(
                Color.Sub.gray10
                    .cornerRadius(15)
                    .shadow(opacity: 0.1, blur: 4)
            )
        }
    }
}
