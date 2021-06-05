import Foundation
import Firebase

final class FavoritesPresenter {
	weak var view: FavoritesViewInput?

	private let router: FavoritesRouterInput
	private let interactor: FavoritesInteractorInput
    
    
    init(router: FavoritesRouterInput, interactor: FavoritesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    private (set) var postersViewModels: [PosterViewModel] = []
}

extension FavoritesPresenter: FavoritesViewOutput {
    
    func didLoadView() {
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                self.interactor.load()
            } else {
                self.router.showProfileView()
            }
        }
    }
    
    func didPullRefresh() {
        interactor.load()
    }
    
    func didTapCell(poster: PosterViewModel) {
        router.showPoster(model: poster)
    }
    
    
}

extension FavoritesPresenter: FavoritesInteractorOutput {
    func didLoad(posters: [PosterViewModel]) {
        self.postersViewModels = posters
        view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
    
}
