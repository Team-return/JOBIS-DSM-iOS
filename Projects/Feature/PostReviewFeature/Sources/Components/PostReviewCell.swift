import SwiftUI
import CodesDomainInterface
import Combine
import DesignSystem
import ReviewsDomainInterface

struct PostReviewCell: View {
    private enum FocusField {
        case title
        case content
    }
    @FocusState private var focusField: FocusField?
    @Binding var qnaElement: QnaElementEntity
    let jobCodeList: [CodeEntity]?
    let index: Int

    init(qnaElement: Binding<QnaElementEntity>, jobCodeList: [CodeEntity]?, index: Int) {
        _qnaElement = qnaElement
        self.jobCodeList = jobCodeList
        self.index = index
    }

    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("질문\(index + 1)")
                    .JOBISFont(.heading(.heading4), color: .Sub.gray90)

                Spacer()

                majorPicker()
            }

            titleTextView()

            contentTextView()
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

    @ViewBuilder
    func majorPicker() -> some View {
        if let jobCodeList {
            Menu {
                ForEach(.constant(jobCodeList), id: \.code) { jobCode in
                    Button {
                        self.qnaElement.code = jobCode.wrappedValue
                    } label: {
                        HStack {
                            Text(jobCode.wrappedValue.keyword)

                            if self.qnaElement.code == jobCode.wrappedValue {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            } label: {
                HStack(spacing: 5) {
                    Text(self.qnaElement.code.keyword)
                        .lineLimit(1)

                    JOBISIcon(.chevronDown)
                        .frame(width: 16, height: 16)
                }
                .padding(.vertical, 6)
                .padding(.leading, 15)
                .padding(.trailing, 10)
                .overlay(alignment: .center) {
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(Color.Sub.gray40, lineWidth: 1)
                }
            }
            .menuStyle(BorderlessButtonMenuStyle())
        }
    }
}
