import UIKit

final class PosterRouter {
    weak var sourceViewController: UIViewController?
    weak var sourceNavigationController: UINavigationController?
}

extension PosterRouter: PosterRouterInput {
    func showPoster(model: PosterViewModel) {
        let viewPosterDetailController = UIViewController()
        viewPosterDetailController.title = model.short_title
        viewPosterDetailController.view.backgroundColor = .systemBackground
        //viewPosterDetailController.modalPresentationStyle = .fullScreen
        
        //let navigationController = UINavigationController(rootViewController: viewPosterDetailController)
        
        sourceViewController?navigationController.present(viewPosterDetailController, animated: true, completion: nil)
        //sourceNavigationController?.pushViewController(viewPosterDetailController, animated: true)
    }
    
}
