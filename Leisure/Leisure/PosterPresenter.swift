import Foundation

final class PosterPresenter {
	weak var view: PosterViewInput?
    weak var moduleOutput: PosterModuleOutput?

	private let router: PosterRouterInput
	private let interactor: PosterInteractorInput

    init(router: PosterRouterInput, interactor: PosterInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension PosterPresenter: PosterModuleInput {
}

extension PosterPresenter: PosterViewOutput {
}

extension PosterPresenter: PosterInteractorOutput {
}
