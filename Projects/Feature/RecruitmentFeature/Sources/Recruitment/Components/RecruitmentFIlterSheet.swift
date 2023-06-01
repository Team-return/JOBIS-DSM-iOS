import DesignSystem
import RecruitmentsDomainInterface
import RecruitmentFeatureInterface
import SwiftUI
import SwiftUIFlowLayout

struct RecruitmentFIlterSheet: View {
    @State var isShowMore = false
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
    @State var techBoolList = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    ]
    @State var selectedJobCode: String = ""
    @State var selectedTechCode: [String] = []

    private let listCellEdgeInset = EdgeInsets(top: 7, leading: 24, bottom: 7, trailing: 24)

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("기술 코드 필터")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.vertical, 18)

            Divider()
                .foregroundColor(.Sub.gray40)
                .padding(.horizontal, 24)

            List {
                VStack(spacing: 0) {
                    searchBar()

                    Text(selectedTechCode.joined(separator: ", "))
                        .JOBISFont(.body(.body4), color: .Sub.gray90)

                    techCodeTagList(jobCodeList: [
                        "백엔드",
                        "프론트엔드",
                        "iOS",
                        "Android",
                        "AI"
                    ])

                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(codeList, id: \.self) { code in
                            HStack {
                                JOBISCheckBox(isOn: $techBoolList[codeList.firstIndex(of: code) ?? 0])

                                Text(code)
                                    .JOBISFont(.body(.body3), color: .Sub.gray60)
                            }
                            .onChange(of: techBoolList[codeList.firstIndex(of: code) ?? 0]) { newValue in
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
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(listCellEdgeInset)
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden)
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
        VStack {
            FlowLayout(
                mode: .scrollable,
                items: isShowMore ? jobCodeList : Array(jobCodeList[0...3]),
                itemSpacing: 4
            ) { jobCode in
                TechTagCell(
                    text: jobCode,
                    isSelected: selectedJobCode.contains(jobCode)
                ) {
                    if selectedJobCode == jobCode {
                        selectedJobCode = ""
                    } else {
                        selectedJobCode = jobCode
                    }
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)

            Text(isShowMore ? "간략히" : "더보기")
                .underline(color: .Sub.gray60)
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .onTapGesture {
                    isShowMore.toggle()
                }
        }
    }
}
