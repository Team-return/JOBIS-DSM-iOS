import DesignSystem
import SwiftUI
import Combine

struct PostReviewView: View {
    private enum FocusField {
        case title
        case content
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: PostReviewViewModel
    @Environment(\.dismiss) var dismiss

    let companyID: Int

    init(
        viewModel: PostReviewViewModel,
        companyID: Int
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.companyID = companyID
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.qnaElements.count, id: \.self) { index in
                        PostReviewCell(qnaElement: $viewModel.qnaElements[index])
                    }

                    Button {
                        viewModel.qnaElements.append(.init(question: "", answer: "", codeID: 0))
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.Main.lightBlue)
                            .frame(width: 12, height: 12)
                            .padding(9)
                            .background(Color.Sub.gray10)
                            .clipShape(Circle())
                            .shadow(blur: 4)
                            .padding(.horizontal, 20)
                    }

                    SolidBtn(text: "완료", size: .large) {
                        viewModel.postReview(companyID: self.companyID)
                    }
                }
                .padding(.horizontal, 20)
            }

            if viewModel.isLoading {
                Color.black.opacity(0.3).ignoresSafeArea()

                ProgressView().progressViewStyle(.circular)
            }
        }
        .background(Color.Sub.gray10)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("버그 제보하기")
        .navigationBarItems(trailing: majorPicker())
        .onChange(of: viewModel.isSuccessPost) { _ in
            dismiss()
        }
        .jobisToast(
            isShowing: $viewModel.isErrorOcuured,
            message: viewModel.errorMessage,
            style: .error
        )
    }

    @ViewBuilder
    func majorPicker() -> some View {
        Menu {
            ForEach(viewModel.jobCodeList?.codes ?? [], id: \.self) { jobCode in
                Button {
                    viewModel.selectedJobCode = jobCode
                } label: {
                    HStack {
                        Text(jobCode.keyword)

                        if viewModel.selectedJobCode == jobCode {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5) {
                Spacer()

                Text(viewModel.selectedJobCode.keyword)

                JOBISIcon(.chevronDown)
                    .frame(width: 16, height: 16)
            }
            .frame(width: 75)
        }
        .menuStyle(BorderlessButtonMenuStyle())
    }
}
