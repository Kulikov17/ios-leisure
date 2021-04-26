import Foundation

protocol MapViewInput: class {
    func reloadData()
}

protocol MapViewOutput: AnyObject {
     var mapPlaces: [MapPlace] { get }
    
     func didLoadView()
     func didPullRefresh()
}

protocol MapInteractorInput: AnyObject {
    func load(places: [MapServiceInfo])
}

protocol MapInteractorOutput: AnyObject {
    func didLoad(places: [MapResults])
    func didReceive(error: Error)
}

protocol MapRouterInput: class {
}
