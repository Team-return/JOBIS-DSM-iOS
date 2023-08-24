import SwiftUI
import ReviewsDomainInterface
import DesignSystem

struct QnaListCellView: View {
    @State private var isShowingDetail = false
    var qna: QnaEntity

    public init(
        qna: QnaEntity
    ) {
        self.qna = qna
    }
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                    Text("Q.")
                        .JOBISFont(.heading(.heading5), color: .Main.lightBlue)

                    Text(qna.question)
                        .JOBISFont(.body(.body2), color: .Sub.gray80)
                        .frame(height: 32)

                    Spacer()

                    JOBISIcon(.chevronDown)
                        .frame(width: 16, height: 16)
                        .rotationEffect(
                            isShowingDetail
                            ? Angle.degrees(180)
                            : .degrees(0)
                        )
                        .onTapGesture {
                            withAnimation {
                                isShowingDetail.toggle()
                            }
                        }
                }

                if isShowingDetail {
                    Text(qna.answer)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)

                    HStack {
                        Spacer()

                        Text(qna.area)
                            .JOBISFont(.etc(.caption), color: .State.message)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(Color.Main.lightBlue.opacity(0.1))
        .cornerRadius(5)
        .padding(.horizontal, 24)
    }
}
