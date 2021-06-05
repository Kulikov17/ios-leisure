import UIKit

final class MapRouter {
    weak var sourceViewController: UIViewController?
}

extension MapRouter: MapRouterInput {
    
    func showPoster(model: PosterViewModel) {
        let viewPosterDetailController = DetailsViewController(poster: model)
        viewPosterDetailController.view.backgroundColor = .systemBackground
        sourceViewController?.navigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
}
    
