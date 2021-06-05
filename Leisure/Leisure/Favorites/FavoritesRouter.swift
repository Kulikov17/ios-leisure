import UIKit

final class FavoritesRouter {
    weak var sourceViewController: UIViewController?
    weak var sourceTabBarController: UITabBarController?
}

extension FavoritesRouter: FavoritesRouterInput {
    func showPoster(model: PosterViewModel) {
        let viewPosterDetailController = DetailsViewController(poster: model)
        viewPosterDetailController.view.backgroundColor = .systemBackground
        sourceViewController?.navigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
    
    func showProfileView() {
        self.sourceTabBarController?.selectedIndex = 3
    }
}
