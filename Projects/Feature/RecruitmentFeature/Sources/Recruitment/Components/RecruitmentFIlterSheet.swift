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
    @State var howMove: CGFloat = 0

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("기술 코드 필터")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.vertical, 18)

            Divider()
                .foregroundColor(.Sub.gray40)
                .padding(.horizontal, 24)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {

                    searchBar()

                    ZStack(alignment: .top) {
                        techCodeTagList(jobCodeList: [
                            "백엔드",
                            "프론트엔드",
                            "iOS",
                            "Android",
                            "AI",
                            "게임 개발",
                            "임베디드",
                            "서버개발",
                            "FullStack",
                            "사과먹고싶당"
                        ])

                        VStack {
                            Spacer()
                                .frame(height: howMove)

                            VStack {
                                Text(isShowMore ? "접기" : "분야 선택")
                                    .underline(color: .Sub.gray60)
                                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
                                    .onTapGesture { isShowMore.toggle() }

                                HStack(alignment: .top, spacing: 0) {
                                    Text("선택 됨 : ")
                                        .JOBISFont(.body(.body4), color: .Sub.gray90)

                                    Text(selectedTechCode.joined(separator: " | "))
                                        .JOBISFont(.body(.body4), color: .Main.lightBlue)

                                    Spacer()
                                }

                                jobCodeList()
                            }
                            .background(Color.Sub.gray10)
                        }
                        .animation(.easeIn, value: howMove)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
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
        ) { jobCode in
            let action = {
                if selectedJobCode == jobCode {
                    selectedJobCode = ""
                } else {
                    selectedJobCode = jobCode
                }
            }

            if selectedJobCode.contains(jobCode) {
                SolidBtn(text: jobCode, size: .small) { action() }
            } else {
                ShadowBtn(text: jobCode, size: .small) { action() }
            }
        }
        .padding(.vertical, 10)
        .background {
            GeometryReader { proxy in
                Color.clear
                    .onChange(of: isShowMore) { newValue in
                        howMove = newValue ? proxy.size.height : 0
                    }
            }
        }
    }

    @ViewBuilder
    func jobCodeList() -> some View {
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
}
