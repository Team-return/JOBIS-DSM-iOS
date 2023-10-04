import SwiftUI
import PhotosUI

public extension View {
    func imagePicker(isShow: Binding<Bool>, uiImage: Binding<UIImage?>) -> some View {
        self
            .sheet(isPresented: isShow) {
                ImagePicker(image: uiImage)
                    .ignoresSafeArea()
            }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    private let controller = UIImagePickerController()
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: ImagePicker
        init(photoPicker: ImagePicker) {
            self.photoPicker = photoPicker
        }
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1),
                      let compressedImage = UIImage(data: data) else { return }
                photoPicker.image = compressedImage
            }
            picker.dismiss(animated: true)
        }
    }
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
