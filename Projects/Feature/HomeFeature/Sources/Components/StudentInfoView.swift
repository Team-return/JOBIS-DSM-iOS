import SwiftUI
import DesignSystem

struct StudentInfoView: View {
    var body: some View {
        HStack(spacing: 13) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.Sub.gray50)

            VStack(spacing: 0) {
                Text("3101 홍길동")
                    .JOBISFont(.body(.body2), color: .Sub.gray70)
                Text("소프트웨어개발과")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
        .padding(.leading, 30)
        .padding(.bottom, 22)
    }
}
