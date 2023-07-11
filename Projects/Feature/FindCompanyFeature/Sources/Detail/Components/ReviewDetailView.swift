import SwiftUI
import ReviewsDomainInterface
import DesignSystem

struct ReviewDetailView: View {
    @Environment(\.dismiss) var dismiss
    var reviewDetail: ReviewDetailEntity?

    var body: some View {
        ScrollView {
            if let reviewDetail {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(reviewDetail.qnaResponses, id: \.self) { qna in
                        QnaListCellView(qna: qna)
                    }

                    Spacer()
                }
                .navigationBarTitle(reviewDetail.writer + "님의 후기")
                .jobisBackButton { dismiss() }
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
    }
}
