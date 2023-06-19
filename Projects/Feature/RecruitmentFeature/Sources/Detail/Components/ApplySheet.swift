import SwiftUI
import DesignSystem

struct ApplySheet: View {
    @Binding var urls: [String]
    @State var files: [String] = []
    let submitDoc: String
    let applyAction: () -> Void

    init(
        urls: Binding<[String]>,
        submitDoc: String,
        applyAction: @escaping () -> Void
    ) {
        _urls = urls
        self.submitDoc = submitDoc
        self.applyAction = applyAction
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("메뉴")
                    .JOBISFont(.body(.body2), color: .Sub.gray60)
                    .padding([.bottom, .leading], 5)

                Divider().foregroundColor(.Sub.gray40)
                    .padding(.bottom, 25)

                Text("제출 서류 : \(submitDoc)")
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
                    .padding(.bottom, 15)

                fetchFiles()
                    .padding(.horizontal, 2)
                    .padding(.bottom, 18)

                inputURLs()
                    .padding(.horizontal, 2)
                    .padding(.bottom, 30)

                HStack {
                    Spacer()

                    SolidBtn(text: "지원하기") { applyAction() }

                    Spacer()
                }
            }
        }
        .padding(15)
        .background(Color.Sub.gray10)
        .frame(maxHeight: UIScreen.main.bounds.height / 2)
        .padding(10)
        .padding(.horizontal, 18)
        .animation(.spring(response: 0.1), value: [urls, files])
    }

    @ViewBuilder
    func fetchFiles() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("첨부파일")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.leading, 5)

            ForEach(0..<files.count, id: \.self) { index in
                HStack(spacing: 2) {
                    Text("files[index]")
                        .JOBISFont(.etc(.caption), color: .Sub.gray90)

                    Text("11KB")
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Spacer()

                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.Sub.gray90)
                        .frame(width: 9, height: 9)
                        .onTapGesture {
                            files.remove(at: index)
                        }
                }
                .padding(10)
                .background(Color.Sub.gray10)
                .cornerRadius(10)
                .shadow(opacity: 0.1, blur: 4)
            }

            addDataButton(explain: "눌러서 파일 추가하기") {
                files.append("")
            }
        }
    }

    @ViewBuilder
    func inputURLs() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("URL")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.leading, 5)

            ForEach(0..<urls.count, id: \.self) { index in
                JOBISTextField(
                    placeholder: "URL 입력",
                    text: $urls[index],
                    inputType: .deletable,
                    outlinedType: .outlined,
                    deleteAction: {
                        urls.remove(at: index)
                    }
                )
            }

            addDataButton(explain: "눌러서 입력란 추가하기") {
                urls.append("")
            }
        }
    }

    @ViewBuilder
    func addDataButton(explain: String, _ addAction: @escaping () -> Void) -> some View {
        Button {
            addAction()
        } label: {
            VStack {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.Sub.gray60)
                    .frame(width: 15, height: 15)

                Text(explain)
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color.Sub.gray10)
            .cornerRadius(10)
            .shadow(opacity: 0.1, blur: 4)
        }
    }
}
