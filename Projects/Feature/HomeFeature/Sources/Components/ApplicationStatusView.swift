import SwiftUI
import StudentsDomainInterface
import DesignSystem

struct ApplicationStatusView: View {
    let applicationList: [ApplyCompanyEntity]

    var body: some View {
        VStack(alignment: .leading) {
            Text("지원현황")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.bottom, 4)
                .padding(.leading, 9)
            if applicationList.isEmpty {
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
            } else {
                ForEach(applicationList, id: \.self) { data in
                    applicationStatusCell(title: data.companyName, applicationStatus: data.status)
                }
            }
        }
        .padding(.horizontal, 30)
    }

    @ViewBuilder
    func applicationStatusCell(title: String, applicationStatus: String) -> some View {
        HStack {
            Text(title)
                .JOBISFont(.body(.body4), color: .Sub.gray70)

            Spacer()

            Text(applicationStatus)
                .JOBISFont(.body(.body3), color: .Main.lightBlue)
        }
        .padding(.vertical, 13)
        .padding(.horizontal, 18)
        .background(Color.Sub.gray10)
        .cornerRadius(10)
        .padding(1)
        .background(Color.Sub.gray40)
        .cornerRadius(10)
    }
}
