import SwiftUI
import DesignSystem

struct ApplicationStatusView: View {
    var body: some View {
            VStack(alignment: .leading) {
                Text("지원현황")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
                    .padding(.bottom, 4)
                    .padding(.leading, 9)

                HStack {
                    Spacer()

                    Text("아직 지원한 기업이 없어요")
                        .JOBISFont(.etc(.caption), color: .Sub.gray50)
                        .padding(.vertical, 17)

                    Spacer()
                }
                .background(Color.Sub.gray10)
                .cornerRadius(10)
                .padding(1)
                .background(Color.Sub.gray40)
                .cornerRadius(10)
            }
            .padding(.horizontal, 30)
        }
}
