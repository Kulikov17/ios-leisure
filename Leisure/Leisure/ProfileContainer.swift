import UIKit

final class ProfileContainer {
	let viewController: UIViewController
    
    private init(view: UIViewController) {
        self.viewController = view
    }

    class func assemble(with: UITabBarController) -> ProfileContainer {
        let router = ProfileRouter()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(router: router, interactor: interactor)
		let viewController = ProfileViewController(output: presenter)

		presenter.view = viewController
		interactor.output = presenter
        router.sourceTabBarController = with

        return ProfileContainer(view: viewController)
	}
}
