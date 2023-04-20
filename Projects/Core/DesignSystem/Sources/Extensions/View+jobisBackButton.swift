import SwiftUI

struct JobisBackButtonModifier: ViewModifier {
    let willDismiss: () -> Void
    let dismiss: DismissAction
    let title: String

    public init(
        willDismiss: @escaping () -> Void,
        dismiss: DismissAction,
        title: String = ""
    ) {
        self.willDismiss = willDismiss
        self.dismiss = dismiss
        self.title = title
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        dismiss()
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
        willDismiss: @escaping () -> Void = {},
        dismiss: DismissAction,
        title: String = ""
    ) -> some View {
        modifier(JobisBackButtonModifier(willDismiss: willDismiss, dismiss: dismiss, title: title))
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
