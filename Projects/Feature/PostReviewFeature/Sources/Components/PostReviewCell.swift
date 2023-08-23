import SwiftUI
import Combine
import DesignSystem
import ReviewsDomainInterface

struct PostReviewCell: View {
    private enum FocusField {
        case title
        case content
    }
    @FocusState private var focusField: FocusField?
    @Binding var qnaElement: QnaElementRequestDTO

    init(qnaElement: Binding<QnaElementRequestDTO>) {
        _qnaElement = qnaElement
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    titleTextView()
                        .padding(.bottom, 25)

                    contentTextView()
                        .padding(.bottom, 25)
                }
            }
        }
    }

    @ViewBuilder
    func titleTextView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("면접질문")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextField(
                "면접에서 답변했던 질문을 작성해주세요",
                text: $qnaElement.question
            ) {
                focusField = .content
            }
            .focused($focusField, equals: .title)
            .onReceive(Just(qnaElement.question)) { _ in
                if 20 < qnaElement.question.count {
                    qnaElement.question = String(qnaElement.question.prefix(20))
                }
            }
        }
    }

    @ViewBuilder
    func contentTextView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("답변내용")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextEditor("해당 질문에 답변했던 내용을 작성해주세요", text: $qnaElement.answer)
                .focused($focusField, equals: .content)
                .onReceive(Just(qnaElement.answer)) { _ in
                    if 400 < qnaElement.answer.count {
                        qnaElement.answer = String(qnaElement.answer.prefix(400))
                    }
                }
        }
    }
}
