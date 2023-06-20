import DesignSystem
import CodesDomainInterface
import RecruitmentsDomainInterface
import RecruitmentFeatureInterface
import UtilityModule
import SwiftUI
import SwiftUIFlowLayout

struct RecruitmentFilterSheet: View {
    @State private var isShowMore = false
    @State private var howMove: CGFloat = 0

    @StateObject var viewModel: RecruitmentViewModel

    init(
        viewModel: RecruitmentViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("기술 코드 필터")
                .JOBISFont(.body(.body4), color: .Sub.gray60)
                .padding(.vertical, 18)

            ZStack(alignment: .bottom) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 5) {

                        searchBar()

                        ZStack(alignment: .top) {
                            jobCodeTagList(jobCodeList: viewModel.jobCodeList)

                            VStack {
                                Spacer()
                                    .frame(height: howMove)

                                VStack {
                                    Text(isShowMore ? "접기" : "분야 선택")
                                        .underlineText(color: .Sub.gray60)
                                        .JOBISFont(.etc(.caption), color: .Sub.gray60)
                                        .onTapGesture { isShowMore.toggle() }

                                    selectedOption()

                                    techCodeList(techCodeList: viewModel.techCodeList)
                                }
                                .background(Color.Sub.gray10)
                            }
                            .animation(.easeIn, value: howMove)
                        }
                    }
                }

                SolidBtn(text: "적용", size: .large) {
                    viewModel.fetchRecruitment()
                    viewModel.isShowFilterSheet.toggle()
                }
                .padding(.bottom, 10)
            }
        }
        .padding(.horizontal, 20)
        .hideKeyboardWhenTap()
        .onAppear {
            viewModel.sheetOnAppear()
        }
    }
    @ViewBuilder
    func selectedOption() -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text("선택 됨 : ")
                .JOBISFont(.body(.body4), color: .Sub.gray90)

            Text(
                viewModel.selectedTechCode.map { $0.keyword }
                    .joined(separator: " | ")
            )
            .JOBISFont(.body(.body4), color: .Main.lightBlue)

            Spacer()
        }
    }

    @ViewBuilder
    func searchBar() -> some View {
        JOBISTextField(
            placeholder: "기술 코드를 입력해주세요.",
            text: $viewModel.techCodeText,
            inputType: .search,
            outlinedType: .outlined,
            onCommit: {
                viewModel.sheetOnAppear()
            }
        )
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }

    @ViewBuilder
    func jobCodeTagList(jobCodeList: [CodeEntity]) -> some View {
        FlowLayout(
            mode: .scrollable,
            items: jobCodeList,
            itemSpacing: 4
        ) { jobCode in
            let action = {
                viewModel.selectedJobCode = viewModel.selectedJobCode == jobCode ? nil : jobCode
            }

            if viewModel.selectedJobCode == jobCode {
                SolidBtn(text: jobCode.keyword, size: .small) { action() }
            } else {
                ShadowBtn(text: jobCode.keyword, size: .small) { action() }
            }
        }
        .padding(.vertical, 10)
        .background(GeometryReader { proxy in
            Color.clear.onChange(of: isShowMore) {
                howMove = $0 ? proxy.size.height : 0
            }
        })
    }

    @ViewBuilder
    func techCodeList(techCodeList: [CodeEntity]) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(techCodeList, id: \.self) { code in
                TechCodeListCell(
                    title: code.keyword,
                    isChecked: viewModel.selectedTechCode.contains(code)
                ) {
                    withAnimation(.easeIn(duration: 0.3)) {
                        if viewModel.selectedTechCode.contains(code) {
                            viewModel.selectedTechCode.removeAll { $0 == code }
                        } else {
                            viewModel.selectedTechCode.append(code)
                        }
                    }
                }

                if code != techCodeList.last {
                    Divider()
                        .foregroundColor(.Sub.gray40)
                }
            }

            Spacer()
        }
        .padding(.bottom, 70)
        .frame(maxHeight: .infinity)
    }
}
