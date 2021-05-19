import UIKit

final class PosterContainer {
	let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

	class func assemble() -> PosterContainer {
        let router = PosterRouter()
        let interactor = PosterInteractor()
        let presenter = PosterPresenter(router: router, interactor: interactor)
		let viewController = PosterViewController(output: presenter)

        router.sourceViewController = viewController
        router.sourcePresenter = presenter
		presenter.view = viewController
		interactor.output = presenter

        return PosterContainer(viewController: viewController)
	}
}
