import Foundation

protocol PosterViewInput: AnyObject {
    func reloadData()
}

protocol PosterViewOutput: AnyObject {
    
    var postersViewModels: [PosterViewModel] { get }
    var filteredPostersViewModels: [PosterViewModel] { get set }
    
    func didLoadView()
    func didPullRefresh()
    func didTapCell(at index: Int)
}

protocol PosterInteractorInput: AnyObject {
    func load(posters: [PosterServiceInfo])
}

protocol PosterInteractorOutput: AnyObject {
    func didLoad(posters: [PosterResults])
    func didReceive(error: Error)
}

protocol PosterRouterInput: AnyObject {
    func showPoster(model: PosterViewModel)
}
