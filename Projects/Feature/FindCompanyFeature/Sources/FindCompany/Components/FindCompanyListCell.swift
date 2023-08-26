import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import DesignSystem
import Kingfisher
import UtilityModule

struct FindCompanyListCell: View {
    let companyEntity: CompanyEntity

    private let findCompanyDetailFactory: any FindCompanyDetailFactory

    init(
        companyEntity: CompanyEntity,
        findCompanyDetailFactory: any FindCompanyDetailFactory
    ) {
        self.companyEntity = companyEntity
        self.findCompanyDetailFactory = findCompanyDetailFactory
    }

    var body: some View {
        NavigationLink {
            findCompanyDetailFactory.makeView(id: String(companyEntity.id), isDetail: false)
                .eraseToAnyView()
        } label: {
            HStack(spacing: 12) {
                URLImage(imageURL: companyEntity.logoURL, shape: .square(80))
                    .cornerRadius(15)
                    .padding(8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(companyEntity.name)
                        .JOBISFont(.body(.body2), color: .Sub.gray90)

                    Text("연매출 " + companyEntity.take.intComma() + "억")
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.top, 14)

                Spacer()
            }
            .frame(height: 96)
            .background(Color.Sub.gray10)
            .cornerRadius(15)
            .shadow(color: .black, opacity: 0.1, blur: 4)
        }
    }
}
