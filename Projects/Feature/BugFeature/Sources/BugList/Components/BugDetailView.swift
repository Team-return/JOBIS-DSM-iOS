import DesignSystem
import BugsDomainInterface
import SwiftUI
import UtilityModule
import Kingfisher

struct BugDetailView: View {
    @State private var isNaviateScreenshot = false
    let bugDetail: BugDetailEntity?

    init(bugDetail: BugDetailEntity?) {
        self.bugDetail = bugDetail
    }

    var body: some View {
        VStack {
            if let bugDetail {
                ScrollView {
                    VStack(spacing: 0) {
                        titleTextView(title: bugDetail.title)
                            .padding(.bottom, 25)

                        contentTextView(content: bugDetail.content)
                            .padding(.bottom, 25)

                        if !(bugDetail.attachments.isEmpty) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("스크린샷 (\(bugDetail.attachments.count)/5)")
                                    .JOBISFont(.etc(.caption), color: .Sub.gray70)

                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<bugDetail.attachments.count, id: \.self) { index in
                                            Button {
                                                self.isNaviateScreenshot.toggle()
                                            } label: {
                                                KFImage(URL(string: bugDetail.attachments[index]))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: 200)
                                                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 200)
                                                    .background(Color.Sub.gray10)
                                                    .cornerRadius(10)
                                                    .padding(1)
                                                    .background(Color.Sub.gray40)
                                                    .cornerRadius(10)
                                            }
                                            .fullScreenCover(isPresented: $isNaviateScreenshot) {
                                                BugScreenshotView(
                                                    attachments: bugDetail.attachments,
                                                    index: index
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 25)
                        }

                        Spacer()

                        SolidBtn(text: "수정 완료", size: .large) {
                            print("수정 했어요!")
                        }
                        .disabled(true)
                    }
                    .padding(.horizontal, 20)
                }
            } else {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .background(Color.Sub.gray10)
    }

    @ViewBuilder
    func titleTextView(title: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("제목")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextField(
                text: .constant(title)
            )
            .disabled(true)
        }
    }

    @ViewBuilder
    func contentTextView(content: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("내용")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextEditor(text: .constant(content))
                .disabled(true)
        }
    }
}
