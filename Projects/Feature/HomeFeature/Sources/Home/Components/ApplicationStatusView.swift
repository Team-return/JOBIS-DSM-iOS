import SwiftUI
import DesignSystem
import ApplicationsDomainInterface

struct ApplicationStatusView: View {
    @Binding var selectedId: String?
    let applicationList: [ApplicationEntity]?

    var body: some View {
        VStack(alignment: .leading) {
            Text("지원현황")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.bottom, 4)
            if let applicationList,
               !applicationList.isEmpty {
                ScrollView {
                    ForEach(applicationList, id: \.self) { data in
                        applicationStatusCell(
                            id: String(data.applicationID),
                            title: data.company,
                            applicationStatus: data.applicationStatus
                        )
                    }
                }
            } else {
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
        }
        .padding(.horizontal, 30)
    }

    @ViewBuilder
    func applicationStatusCell(id: String, title: String, applicationStatus: ApplicationStatusType) -> some View {
        HStack {
            Text(title)
                .JOBISFont(.body(.body4), color: .Sub.gray70)

            Spacer()

            Text(applicationStatus.localizedString())
                .JOBISFont(.body(.body3), color: .Main.lightBlue)
        }
        .padding(.vertical, 13)
        .padding(.horizontal, 18)
        .background(Color.Sub.gray10)
        .cornerRadius(10)
        .padding(1)
        .background(Color.Sub.gray40)
        .cornerRadius(10)
        .onTapGesture {
            guard applicationStatus == .rejected else { return }
            selectedId = id
        }
    }
}
