import UIKit

final class ProfileRouter {
    weak var sourceTabBarController: UITabBarController?
}

extension ProfileRouter: ProfileRouterInput {
    func showPosterView() {
        self.sourceTabBarController?.selectedIndex = 0
    }
}
