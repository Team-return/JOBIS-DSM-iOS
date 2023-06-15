import SwiftUI
import StudentsDomainInterface
import Kingfisher
import DesignSystem

struct StudentInfoView: View {
    @Binding var isLoading: Bool
    let studentInfo: StudentInfoEntity?

    var body: some View {
        HStack(spacing: 13) {
            KFImage(URL(string: studentInfo?.profileImageUrl ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 0) {
                Text("\(studentInfo?.studentGcn ?? "Loading...") \(studentInfo?.studentName ?? "")")
                    .JOBISFont(.body(.body2), color: .Sub.gray70)

                Text(studentInfo?.department.localizedString() ?? "")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
        }
        .padding(.leading, 30)
        .padding(.bottom, 22)
    }
}
