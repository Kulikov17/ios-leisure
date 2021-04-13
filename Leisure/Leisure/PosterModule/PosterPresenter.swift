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
    
    private var locationServiceInfos: [PosterServiceInfo] = [
        PosterServiceInfo(location: "msk")
    ]
    
    private (set) var postersViewModels: [PosterViewModel] = []
}

extension PosterPresenter: PosterModuleInput {
}

extension PosterPresenter: PosterViewOutput {
    var posterViewModels: [PosterViewModel] {
        return self.postersViewModels
    }
    
    func didLoadView() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didTapCell() {
        print("a")
    }
}

extension PosterPresenter: PosterInteractorOutput {
    func didLoad(posters: [Results]) {
        let postersViewModels = posters.map { poster in
            return PosterViewModel(id: poster.id,
                                   title: poster.title,
                                   description: poster.description,
                                   price: Int(poster.price) ?? 0)
           }
           
        self.postersViewModels = postersViewModels
        view?.reloadData()
    }
}
