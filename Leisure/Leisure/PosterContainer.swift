import UIKit

final class PosterContainer {
    let input: PosterModuleInput
	let viewController: UIViewController
	private(set) weak var router: PosterRouterInput!

	class func assemble(with context: PosterContext) -> PosterContainer {
        let router = PosterRouter()
        let interactor = PosterInteractor()
        let presenter = PosterPresenter(router: router, interactor: interactor)
		let viewController = PosterViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return PosterContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: PosterModuleInput, router: PosterRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct PosterContext {
	weak var moduleOutput: PosterModuleOutput?
}
