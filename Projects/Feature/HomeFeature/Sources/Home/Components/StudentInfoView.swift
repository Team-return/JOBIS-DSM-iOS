import SwiftUI
import StudentsDomainInterface
import Kingfisher
import DesignSystem

struct StudentInfoView: View {
    let studentInfo: StudentInfoEntity?

    var body: some View {
        HStack(spacing: 13) {
            URLImage(
                imageURL: studentInfo?.profileImageUrl ??
                "https://jobis-store.s3.ap-northeast-2.amazonaws.com/EXTENSION_FILE/default_profile.png",
                shape: .square(45)
            )
            .clipShape(Circle())

            VStack(alignment: .leading, spacing: 0) {
                Text("\(studentInfo?.studentGcn ?? "") \(studentInfo?.studentName ?? "Loading...")")
                    .JOBISFont(.body(.body1), color: .Sub.gray70)

                Text(studentInfo?.department.localizedString() ?? "")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
        .padding(.leading, 30)
        .padding(.bottom, 22)
    }
}
