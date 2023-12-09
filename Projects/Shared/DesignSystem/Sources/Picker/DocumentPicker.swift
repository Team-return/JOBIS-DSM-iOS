import SwiftUI

public extension View {
    func documentPicker(isShow: Binding<Bool>, url: Binding<[URL]>) -> some View {
        self
            .sheet(isPresented: isShow) {
                DocumentPicker(selectedURL: url)
                    .ignoresSafeArea()
            }
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var selectedURL: [URL]

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.data])
        documentPicker.allowsMultipleSelection = true
        documentPicker.delegate = context.coordinator
        return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(selectedURL: $selectedURL)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        @Binding var selectedURL: [URL]

        init(selectedURL: Binding<[URL]>) {
            _selectedURL = selectedURL
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            let allURL = selectedURL + urls
            var maxIndex: Int {
                if allURL.count < 3 {
                    return allURL.count
                } else {
                    return 3
                }
            }
            selectedURL = Array(allURL[..<maxIndex])
        }
    }
}
