import UIKit

final class PosterRouter {
    weak var sourceViewController: UIViewController?
    weak var sourceNavigationController: UINavigationController?
    weak var sourcePresenter: PosterViewOutput?
}

extension PosterRouter: PosterRouterInput {
    
    func showPoster(model: PosterViewModel) {
        let viewPosterDetailController = DetailsViewController(poster: model)
        viewPosterDetailController.view.backgroundColor = .systemBackground
        sourceViewController?.navigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
    
    func openFilter(){
        let viewPosterDetailController = FilterViewController(presenter: sourcePresenter!)
        viewPosterDetailController.view.backgroundColor = .systemBackground
        sourceViewController?.navigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
    
}
