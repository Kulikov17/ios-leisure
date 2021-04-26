import Foundation
import MapKit

final class MapPresenter {
	weak var view: MapViewInput?
	private let router: MapRouterInput
	private let interactor: MapInteractorInput

    init(router: MapRouterInput, interactor: MapInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    private var locationServiceInfos: [MapServiceInfo] = [
        MapServiceInfo(location: "msk")
    ]
    
    private (set) var mapPlaces: [MapPlace] = []
}

extension MapPresenter: MapViewOutput {
    func didLoadView() {
        interactor.load(places: locationServiceInfos)
    }
       
    func didPullRefresh() {
        interactor.load(places: locationServiceInfos)
    }
}

extension MapPresenter: MapInteractorOutput {
    func didLoad(places: [MapResults]) {
        let mapPlaces = places.map { place in
            return MapPlace(title: place.short_title,
                            locationName: place.title,
                            discipline: place.categories[0],
                            coordinate: CLLocationCoordinate2D(latitude: place.place?.coords.lat ?? 55.751244, longitude: place.place?.coords.lon ?? 37.618423))
           
        }
           
        self.mapPlaces = mapPlaces
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
}
