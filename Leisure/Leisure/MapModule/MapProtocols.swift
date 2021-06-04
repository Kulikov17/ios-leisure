import Foundation

protocol MapViewInput: AnyObject {
    func reloadData()
}

protocol MapViewOutput: AnyObject {
    var mapPlaces: [MapPlace] { get }
    
    func didLoadView()
    func didPullRefresh()
    func didTapCell(poster: PosterViewModel)
}

protocol MapInteractorInput: AnyObject {
    func load(places: MapServiceInfo)
}

protocol MapInteractorOutput: AnyObject {
    func didLoad(places: [MapResults])
    func didReceive(error: Error)
}

protocol MapRouterInput: AnyObject {
    func showPoster(model: PosterViewModel)
}
