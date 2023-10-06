import SwiftUI
import RecruitmentFeatureInterface
import RecruitmentsDomainInterface
import DesignSystem
import Kingfisher

struct RecruitmentListCell: View {
    @Binding var recruitmentEntitys: [RecruitmentEntity]
    let index: Int
    let bookmark: () -> Void

    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        recruitmentEntitys: Binding<[RecruitmentEntity]>,
        index: Int,
        recruitmentDetailFactory: any RecruitmentDetailFactory,
        bookmark: @escaping () -> Void
    ) {
        _recruitmentEntitys = recruitmentEntitys
        self.index = index
        self.bookmark = bookmark
        self.recruitmentDetailFactory = recruitmentDetailFactory
    }

    var body: some View {
        let recruitmentEntity = recruitmentEntitys[index]
        NavigationLink {
            recruitmentDetailFactory.makeView(
                id: "\(recruitmentEntity.recruitID)", isDetail: false
            )
            .eraseToAnyView()
        } label: {
            HStack(spacing: 12) {
                URLImage(imageURL: recruitmentEntity.companyProfileURL, shape: .square(80))
                    .cornerRadius(15)
                    .padding(8)

                VStack(alignment: .leading, spacing: 0) {
                    Text(recruitmentEntity.jobCodeList)
                        .multilineTextAlignment(.leading)
                        .JOBISFont(.body(.body2), color: .Sub.gray90)

                    Text(recruitmentEntity.companyName)
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Spacer()

                    Text("실습 수당 \(recruitmentEntity.trainPay.intComma())만원")
                        .JOBISFont(.etc(.caption), color: .Sub.gray70)
                }
                .padding(.leading, 8)
                .padding(.vertical, 14)

                Spacer()

                VStack {
                    JOBISIcon(recruitmentEntity.bookmarked ? .bookmarkOn : .bookmarkOff)
                        .frame(width: 12, height: 16)
                        .padding(5)
                        .onTapGesture {
                            recruitmentEntitys[index].bookmarked.toggle()
                            bookmark()
                        }

                    Spacer()

                    JOBISIcon(.militaryServiceExceptionIcon)
                        .frame(width: 20, height: 20)
                        .opacity(recruitmentEntity.military ? 1 : 0)
                }
                .padding(.vertical, 14)
                .padding(.trailing, 20)
            }
            .frame(height: 96)
            .background(Color.Sub.gray10)
            .cornerRadius(15)
            .shadow(color: .black, opacity: 0.1, blur: 4)
        }
    }
}
