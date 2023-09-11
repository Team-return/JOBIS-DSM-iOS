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
        ScrollView {
            VStack(spacing: 50) {
                ForEach(0..<viewModel.qnaElements.count, id: \.self) { index in
                    PostReviewCell(
                        qnaElement: $viewModel.qnaElements[index],
                        jobCodeList: viewModel.jobCodeList?.codes,
                        index: index
                    )
                }

                Button {
                    viewModel.qnaElements.append(
                        .init(
                            question: "",
                            answer: "",
                            code: .init(code: 0, keyword: "직무")
                        )
                    )
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
                .disabled(viewModel.isDisabledPostButton)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.Sub.gray10)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("면접후기 작성")
        .onChange(of: viewModel.isSuccessPost) { _ in
            dismiss()
        }
        .jobisToast(
            isShowing: $viewModel.isErrorOcuured,
            message: viewModel.errorMessage,
            style: .error
        )
    }
}
