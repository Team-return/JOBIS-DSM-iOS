import UIKit

public protocol RenewalPasswordFactory {
    func makeViewController(router: any Router) -> UIViewController
}
