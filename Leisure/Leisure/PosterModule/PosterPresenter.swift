import Foundation

final class PosterPresenter {
	weak var view: PosterViewInput?
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


extension PosterPresenter: PosterViewOutput {
    
    func didLoadView() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didPullRefresh() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didTapCell(at index: Int) {
        let model = postersViewModels[index]
        router.showPoster(model: model)
    }
}

extension PosterPresenter: PosterInteractorOutput {
    func didLoad(posters: [PosterResults]) {
        let postersViewModels = posters.map { poster in
            return PosterViewModel(short_title: poster.short_title, category: poster.categories[0], price: poster.price, is_free: poster.is_free)
           
        }
           
        self.postersViewModels = postersViewModels
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
}
