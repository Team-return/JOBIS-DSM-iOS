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
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                Text("Q.")
                    .JOBISFont(.heading(.heading5), color: .Main.blue)

                Text(qna.question)
                    .JOBISFont(.body(.body3), color: .Sub.gray80)
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
            .padding(.horizontal, 10)
            .padding(.vertical, 20)

            if isShowingDetail {
                VStack(alignment: .leading, spacing: 0) {
                    Text(qna.answer)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)

                    HStack {
                        Spacer()

                        Text(qna.area)
                            .JOBISFont(.etc(.caption), color: .State.message)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color.Sub.gray10)
                            .cornerRadius(8)
                            .padding(.bottom, 4)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.Main.lightBlue.opacity(0.04))
                .cornerRadius(8)
            } else {
                Divider()
                    .foregroundColor(.Sub.gray40)
            }
        }
    }
}
