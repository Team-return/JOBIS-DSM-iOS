import SwiftUI
import PhotosUI

public extension View {
    func imagesPicker(isShow: Binding<Bool>, uiImage: Binding<[UIImage]>, selectionLimit: Int) -> some View {
        self
            .sheet(isPresented: isShow) {
                ImagesPicker(images: uiImage, selectionLimit: selectionLimit)
            }
    }
}

struct ImagesPicker: UIViewControllerRepresentable {

    typealias UIViewControllerType = PHPickerViewController

    @Binding var images: [UIImage]
    var selectionLimit: Int
    var filter: PHPickerFilter? = .images
    var itemProviders: [NSItemProvider] = []

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = self.selectionLimit
        configuration.filter = self.filter
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return ImagesPicker.Coordinator(parent: self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagesPicker

        init(parent: ImagesPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Dismiss picker
            picker.dismiss(animated: true)

            if results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }

            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
        }

        private func loadImage() {
            for itemProvider in parent.itemProviders
            where itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, _  in
                    DispatchQueue.main.async {
                        if let image = image as? UIImage {
                            self.parent.images.append(image)
                        } else {
                            print("파일 형식을 받을 수 없음")
                        }
                    }
                }
            }
        }
    }
}
