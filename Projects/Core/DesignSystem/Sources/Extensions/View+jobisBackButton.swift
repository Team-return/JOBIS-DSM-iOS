import SwiftUI

struct JobisBackButtonModifier: ViewModifier {
    let willDismiss: () -> Void
    let title: String

    public init(
        willDismiss: @escaping () -> Void,
        title: String = ""
    ) {
        self.willDismiss = willDismiss
        self.title = title
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                                .imageScale(.small)
                                .JOBISFont(.body(.body1), color: .Sub.gray70)
                            Text(title)
                                .JOBISFont(.body(.body1), color: .Sub.gray70)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
public extension View {
    func jobisBackButton(
        title: String = "",
        willDismiss: @escaping () -> Void
    ) -> some View {
        modifier(JobisBackButtonModifier(willDismiss: willDismiss, title: title))
    }
}

// SwipeGesture로 뒤로갈 수 있게 하는 extension
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
