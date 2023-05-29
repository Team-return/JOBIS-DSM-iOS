import SwiftUI
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import DesignSystem
import Kingfisher

struct RecruitmentListCell: View {
    @State var isNaviagteDetail = false
    @State private var isBookmarked: Bool = false
    let recruitmentEntity: RecruitmentEntity
    let bookmark: () -> Void

    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        recruitmentEntity: RecruitmentEntity,
        recruitmentDetailFactory: any RecruitmentDetailFactory,
        bookmark: @escaping () -> Void
    ) {
        self.recruitmentEntity = recruitmentEntity
        self.bookmark = bookmark
        self.recruitmentDetailFactory = recruitmentDetailFactory
    }

    var body: some View {
        Button {
            self.isNaviagteDetail.toggle()
        } label: {
            HStack(spacing: 12) {
                KFImage(URL(string: recruitmentEntity.companyProfileURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                    .padding(8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(recruitmentEntity.jobCodeList)
                        .JOBISFont(.body(.body2), color: .Sub.gray90)

                    Text(recruitmentEntity.companyName)
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.top, 14)

                Spacer()

                VStack {
                    JOBISImage(self.isBookmarked ? .bookmarkOn : .bookmarkOff)
                        .frame(width: 12, height: 16)
                        .padding(5)
                        .onTapGesture {
                            isBookmarked.toggle()
                            bookmark()
                        }

                    Spacer()

                    JOBISImage(.militaryServiceExceptionIcon)
                        .frame(width: 16, height: 16)
                        .opacity(recruitmentEntity.military ? 1 : 0)
                }
                .padding(.vertical, 14)
                .padding(.trailing, 20)
            }
            .frame(height: 96)
            .background(Color.Sub.gray10)
            .cornerRadius(15)
            .shadow(color: .black, opacity: 0.1, blur: 4)
            .padding(.horizontal, 24)
            .onAppear {
                self.isBookmarked = self.recruitmentEntity.bookmarked
            }
        }
        .sheet(isPresented: $isNaviagteDetail) {
            recruitmentDetailFactory.makeView(id: String(recruitmentEntity.recruitID))
                .eraseToAnyView()
                .presentationDragIndicator(.visible)
        }
    }
}
