import UIKit

final class PosterRouter {
    weak var sourceViewController: UIViewController?
    weak var sourceNavigationController: UINavigationController?
}

extension PosterRouter: PosterRouterInput {
    
    func showPoster(model: PosterViewModel) {
        let viewPosterDetailController = DetailsViewController(poster: model)
        viewPosterDetailController.view.backgroundColor = .systemBackground
        sourceViewController?.navigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
    
}
