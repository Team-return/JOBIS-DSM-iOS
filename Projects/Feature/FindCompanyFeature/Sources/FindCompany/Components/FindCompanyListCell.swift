import SwiftUI
import FindCompanyFeatureInterface
import CompaniesDomainInterface
import DesignSystem
import Kingfisher
import UtilityModule

struct FindCompanyListCell: View {
    @State var isNaviagteDetail = false
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
        Button {
            self.isNaviagteDetail.toggle()
        } label: {
            HStack(spacing: 12) {
                KFImage(URL(string: companyEntity.logoURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
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
            .padding(.horizontal, 24)
        }
        .sheet(isPresented: $isNaviagteDetail) {
            findCompanyDetailFactory.makeView(id: String(companyEntity.id))
                .eraseToAnyView()
//                .presentationDragIndicator(.visible)
        }
    }
}
