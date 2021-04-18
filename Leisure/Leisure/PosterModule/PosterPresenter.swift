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
    var posterViewModels: [PosterViewModel] {
        return self.postersViewModels
    }

    func didLoadView() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didPullRefresh() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didTapCell(at index: Int) {
        print(index)
    }
}

extension PosterPresenter: PosterInteractorOutput {
    func didLoad(posters: [PosterResults]) {
        let postersViewModels = posters.map { poster in
            return PosterViewModel(id: poster.id,
                                   title: poster.title,
                                   description: poster.description,
                                   price: Int(poster.price) ?? 0)
           
        }
           
        self.postersViewModels = postersViewModels
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
}
