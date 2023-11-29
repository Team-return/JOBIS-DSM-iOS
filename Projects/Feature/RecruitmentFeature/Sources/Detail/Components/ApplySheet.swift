import SwiftUI
import DesignSystem
import UtilityModule
import BaseFeature

struct ApplySheet: View {
    enum FileType: String {
        case file = "눌러서 파일 추가하기"
        case url = "URL 입력란 추가하기"

        var systemName: JOBISIcon.Image {
            switch self {
            case .file:
                return .upload

            case .url:
                return .plus
            }
        }
    }

    @Binding var urls: [String]
    @Binding var documents: [URL]
    @State var showDocumentPicker = false
    let submitDoc: String
    let applyAction: () -> Void

    init(
        urls: Binding<[String]>,
        documents: Binding<[URL]>,
        submitDoc: String,
        applyAction: @escaping () -> Void
    ) {
        _urls = urls
        _documents = documents
        self.submitDoc = submitDoc
        self.applyAction = applyAction
    }

    var body: some View {
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

            Spacer()

            HStack {
                Spacer()

                SolidBtn(text: "지원하기") {
                    applyAction()
                    hideKeyboard()
                }
                .disabled(documents.isEmpty)

                Spacer()
            }
        }
        .padding(15)
        .background(Color.Sub.gray10)
        .frame(maxHeight: UIScreen.main.bounds.height * 2 / 3)
        .padding(10)
        .padding(.horizontal, 18)
        .animation(.spring(response: 0.1), value: urls)
        .animation(.spring(response: 0.1), value: documents)
    }

    @ViewBuilder
    func fetchFiles() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("첨부파일 \(documents.count)/3")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.leading, 5)

            ForEach(0..<documents.count, id: \.self) { index in
                HStack(spacing: 2) {
                    Text(documents[index].lastPathComponent)
                        .JOBISFont(.etc(.caption), color: .Sub.gray90)
                        .lineLimit(1)

                    Text(documents[index].getFileSize())
                        .JOBISFont(.etc(.caption), color: .Sub.gray60)

                    Spacer()

                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.Sub.gray90)
                        .frame(width: 9, height: 9)
                        .onTapGesture {
                            documents.remove(at: index)
                        }
                }
                .padding(10)
                .background(Color.Sub.gray10)
                .cornerRadius(10)
                .shadow(opacity: 0.1, blur: 4)
            }

            addDataButton(fileType: .file) {
                showDocumentPicker.toggle()
            }
            .disabled(documents.count >= 3)
            .documentPicker(isShow: $showDocumentPicker, url: $documents)
        }
    }

    @ViewBuilder
    func inputURLs() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("URL \(urls.count)/4")
                .JOBISFont(.etc(.caption), color: .Sub.gray60)
                .padding(.leading, 5)

            ForEach(0..<urls.count, id: \.self) { index in
                DeleteableJOBISFormTextField(
                    "URL 입력",
                    text: $urls[index],
                    deleteArray: $urls,
                    deleteIndex: index
                ) {
                    urls.append("")
                }
            }

            addDataButton(fileType: .url) {
                urls.append("")
            }
            .disabled(urls.count >= 4)
        }
    }

    @ViewBuilder
    func addDataButton(fileType: FileType, _ addAction: @escaping () -> Void) -> some View {
        Button {
            addAction()
        } label: {
            VStack {
                JOBISIcon(fileType.systemName)
                    .foregroundColor(.Sub.gray60)
                    .frame(width: 15, height: 15)

                Text(fileType.rawValue)
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
