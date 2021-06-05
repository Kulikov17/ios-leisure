import Foundation

protocol FavoritesViewInput: AnyObject {
    func reloadData()
}

protocol FavoritesViewOutput: AnyObject  {
    var postersViewModels: [PosterViewModel] { get }
    
    func didLoadView()
    func didPullRefresh()
    func didTapCell(poster: PosterViewModel)
}

protocol FavoritesInteractorInput: AnyObject {
    func load()
}

protocol FavoritesInteractorOutput: AnyObject {
    func didLoad(posters: [PosterViewModel])
}

protocol FavoritesRouterInput: AnyObject {
    func showProfileView()
    func showPoster(model: PosterViewModel)
}
