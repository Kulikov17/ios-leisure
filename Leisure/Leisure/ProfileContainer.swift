import UIKit

final class ProfileContainer {
	let viewController: UIViewController
    
    private init(view: UIViewController) {
        self.viewController = view
    }

	class func assemble() -> ProfileContainer {
        let router = ProfileRouter()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(router: router, interactor: interactor)
		let viewController = ProfileViewController(output: presenter)

		presenter.view = viewController
		interactor.output = presenter
        router.sourceViewController = viewController
        router.soursePresenter = presenter

        return ProfileContainer(view: viewController)
	}
}
