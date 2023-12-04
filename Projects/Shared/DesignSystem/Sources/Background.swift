import SwiftUI
import UIKit

public struct Background: UIViewControllerRepresentable {
    public func makeUIViewController(context: UIViewControllerRepresentableContext<Background>) -> UIViewController {
        return Controller()
    }

    public init() { }

    public func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<Background>
    ) { }

    class Controller: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .clear
        }

        override func willMove(toParent parent: UIViewController?) {
            super.willMove(toParent: parent)
            parent?.view?.backgroundColor = .clear
            parent?.modalPresentationStyle = .overCurrentContext
        }
    }
}
