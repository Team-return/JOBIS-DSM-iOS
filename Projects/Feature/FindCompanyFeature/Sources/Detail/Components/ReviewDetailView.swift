import SwiftUI
import ReviewsDomainInterface

struct ReviewDetailView: View {
    let reviewDetail: ReviewDetailEntity?

    var body: some View {
        VStack {
            if let reviewDetail {
                Text(String(reviewDetail.year))
                Text(reviewDetail.writer)
                Text(reviewDetail.qnaResponses.map { $0.answer }.joined(separator: ","))
                Text(reviewDetail.qnaResponses.map { $0.area }.joined(separator: ","))
                Text(reviewDetail.qnaResponses.map { $0.question }.joined(separator: ","))
            }
        }
    }
}
