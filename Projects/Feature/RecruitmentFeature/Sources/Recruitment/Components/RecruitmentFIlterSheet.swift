import DesignSystem
import RecruitmentsDomainInterface
import RecruitmentFeatureInterface
import SwiftUI
import SwiftUIFlowLayout

struct RecruitmentFIlterSheet: View {
    @State var techCodeText = ""
    @State var codeList = [
        "SpringBoot",
        "JavaScript",
        "Swift",
        "Java",
        "HTML",
        "CSS",
        "Kotlin",
        "Phthon"
    ]
    @State var boolList = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    ]
    @State var selectedTechCode: [String] = []

//    @StateObject var viewModel: RecruitmentViewModel
    private let listCellEdgeInset = EdgeInsets(top: 7, leading: 24, bottom: 7, trailing: 24)

//    init(
//        viewModel: RecruitmentViewModel
//    ) {
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("기술 코드 필터")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.vertical, 18)

            Divider()
                .foregroundColor(.Sub.gray40)
                .padding(.horizontal, 24)

            List {
                searchBar()
                    .padding(.top, 12)

                Text(selectedTechCode.joined(separator: ", "))
                    .JOBISFont(.body(.body4), color: .Sub.gray90)

                techCodeTagList(jobCodeList: [
                    "백엔드",
                    "프론트엔드",
                    "iOS",
                    "Android",
                    "AI"
                ])

//                    if let list = viewModel.recruitmentList {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(codeList, id: \.self) { code in
                        HStack {
                            JOBISCheckBox(isOn: $boolList[codeList.firstIndex(of: code) ?? 0])

                            Text(code)
                                .JOBISFont(.body(.body3), color: .Sub.gray60)
                        }
                        .onChange(of: boolList[codeList.firstIndex(of: code) ?? 0]) { newValue in
                            if newValue {
                                selectedTechCode.append(code)
                            } else {
                                selectedTechCode.removeAll { $0 == code }
                            }
                        }

                        if code != codeList.last {
                            Divider()
                                .foregroundColor(.Sub.gray40)
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(listCellEdgeInset)
//                    }
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden)
            .refreshable {
//                    viewModel.onAppear()
            }

//            if viewModel.isLoading {
//                ProgressView().progressViewStyle(.circular)
//            }
        }
        .onAppear {
//            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func searchBar() -> some View {
        JOBISTextField(
            placeholder: "기술 코드를 입력해주세요.",
            text: $techCodeText,
            inputType: .search,
            outlinedType: .outlined
        ) {
//            viewModel.fetchRecruitment()
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }

    @ViewBuilder
    func techCodeTagList(jobCodeList: [String]) -> some View {
        FlowLayout(
            mode: .scrollable,
            items: jobCodeList,
            itemSpacing: 4
        ) {
            ShadowBtn(
                text: $0,
                size: .small
            ) { }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}
