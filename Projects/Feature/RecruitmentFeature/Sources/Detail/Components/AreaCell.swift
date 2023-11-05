import SwiftUI
import DesignSystem
import UtilityModule
import RecruitmentsDomainInterface

struct AreaCell: View {
    @State var isShowDetail = false
    let area: AreaEntity

    init(area: AreaEntity) {
        self.area = area
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(area.job)
                    .JOBISFont(.body(.body3), color: .Sub.gray90)

                Spacer()

                Text("\(area.hiring)명")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }

            areaInfo(title: "주요업무", content: area.majorTask)

            if isShowDetail {
                areaInfo(title: "사용기술", content: area.tech.joined(separator: ", "))
                if let preferentialTreatment = area.preferentialTreatment {
                    areaInfo(title: "우대사항", content: preferentialTreatment)
                }
            }

            HStack {
                Spacer()

                Text(isShowDetail ? "간략히" : "자세히")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
                    .underlineText(color: .Sub.gray60)
                    .onTapGesture {
                        withAnimation(
                            .spring(
                                response: 0.6, dampingFraction: 0.8, blendDuration: 1.0
                            )
                        ) {
                            isShowDetail.toggle()
                        }
                    }

                Spacer()
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.Sub.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.Sub.gray40)
        )
    }

    @ViewBuilder
    func areaInfo(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if isShowDetail {
                Text(title)
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }

            Text(content)
                .lineLimit(isShowDetail ? nil : 1)
                .JOBISFont(.etc(.caption), color: .Sub.gray90)
        }
    }
}
