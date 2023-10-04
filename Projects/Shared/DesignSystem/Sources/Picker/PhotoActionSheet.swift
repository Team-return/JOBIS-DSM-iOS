import SwiftUI
import PhotosUI

struct PhotoActionSheet: ViewModifier {
    var selectionLimit: Int
    @Binding var images: [UIImage]
    @Binding var isShow: Bool
    @State private var isShowCamera: Bool = false
    @State private var isShowImages: Bool = false
    @State private var isShowAlert: Bool = false

    public init(
        selectionLimit: Int = 1,
        images: Binding<[UIImage]>,
        isShow: Binding<Bool>
    ) {
        self.selectionLimit = selectionLimit
        _images = images
        _isShow = isShow
    }

    func body(content: Content) -> some View {
        content
            .confirmationDialog("타이틀", isPresented: $isShow) {
                Button(role: nil) {
                    isShow = false
                    checkCameraPermission {
                        isShowCamera.toggle()
                    } refuse: {
                        isShowAlert.toggle()
                    }

                } label: {
                    Label("사진 촬영", systemImage: "camera.fill")
                    Spacer()
                }

                Button(role: nil) {
                    isShow = false
                    isShowImages.toggle()
                } label: {
                    Label("사진 선택", systemImage: "photo.tv")
                    Spacer()
                }

                Button("취소", role: .cancel) {}
            }
            .cameraPicker(isShow: $isShowCamera, uiImage: $images)
            .imagesPicker(isShow: $isShowImages, uiImage: $images, selectionLimit: selectionLimit)
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("설정"),
                    message: Text("카메라 접근 허용되어 있지않습니다. \r\n 설정화면으로 가시겠습니까?"),
                    primaryButton: Alert.Button.default(
                        Text("설정으로 이동하기"),
                        action: {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        }
                    ),
                    secondaryButton: Alert.Button.cancel(
                        Text("취소")
                    )
                )
            }
    }
}

public extension View {
    func photoActionSheet(
        selectionLimit: Int = 1,
        images: Binding<[UIImage]>,
        _ isShow: Binding<Bool>
    ) -> some View {
        modifier(
            PhotoActionSheet(
                selectionLimit: selectionLimit,
                images: images,
                isShow: isShow
            )
        )
    }
}

extension PhotoActionSheet {
    func checkCameraPermission(
        permission: @escaping () -> Void,
        refuse: @escaping () -> Void
    ) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                permission()
            } else {
                refuse()
            }
        }
    }
}
