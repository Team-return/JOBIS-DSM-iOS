import SwiftUI
import StudentsDomainInterface
import Kingfisher
import DesignSystem

struct StudentInfoView: View {
    let studentInfo: StudentInfoEntity?

    var body: some View {
        HStack(spacing: 13) {
            KFImage(URL(string: studentInfo?.profileImageUrl ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 0) {
                Text("\(studentInfo?.studentGcn ?? "") \(studentInfo?.studentName ?? "Loading")")
                    .JOBISFont(.body(.body1), color: .Sub.gray70)

                Text((studentInfo?.department ?? .none).localizedString())
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
        .padding(.leading, 30)
        .padding(.bottom, 22)
    }
}
