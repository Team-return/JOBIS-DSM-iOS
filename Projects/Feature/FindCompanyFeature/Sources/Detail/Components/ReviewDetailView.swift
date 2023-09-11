import SwiftUI
import ReviewsDomainInterface
import DesignSystem

struct ReviewDetailView: View {
    @Environment(\.dismiss) var dismiss
    var reviewDetail: ReviewDetailEntity?
    let writer: String

    var body: some View {
        ScrollView {
            if let reviewDetail {
                VStack(alignment: .leading, spacing: 0) {
                    Text(writer + "님의 후기")
                        .JOBISFont(.heading(.heading6), color: .Main.darkBlue)
                        .padding(.top, 16)
                        .padding(.bottom, 20)

                    Divider()
                        .foregroundColor(.Main.lightBlue)

                    ForEach(reviewDetail.qnaResponses, id: \.self) { qna in
                        QnaListCellView(qna: qna)
                    }
                }
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .padding(.horizontal, 24)
        .jobisBackButton { dismiss() }
    }
}
