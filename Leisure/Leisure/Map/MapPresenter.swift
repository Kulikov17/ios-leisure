import Foundation
import MapKit

final class MapPresenter {
	weak var view: MapViewInput?
	private let router: MapRouterInput
	private let interactor: MapInteractorInput

    private var categories: [String] = ["business-events", "cinema", "concert", "education", "entertainment", "exhibition", "fashion", "festival",
                                        "holiday", "kids", "other", "party", "photo", "quest",
                                        "recreation", "shopping", "social-activity", "theater",
                                        "tour", "yarmarki-razvlecheniya-yarmarki"]
    
    private var locationServiceInfos: MapServiceInfo = MapServiceInfo(location:"msk", category: [])
    
    init(router: MapRouterInput, interactor: MapInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    func setLocationService(location: String, categories: [String]){
        self.locationServiceInfos.location = location
        self.locationServiceInfos.category = categories
    }
    
    
    private (set) var mapPlaces: [MapPlace] = []
}

extension MapPresenter: MapViewOutput {
    func didTapCell(poster: PosterViewModel) {
        router.showPoster(model: poster)
    }
    
    func didLoadView() {
        interactor.load(places: locationServiceInfos)
    }
       
    func didPullRefresh() {
        interactor.load(places: locationServiceInfos)
    }
}

extension MapPresenter: MapInteractorOutput {
    func didLoad(places: [MapResults]) {
        let mapPlaces = places.map { place -> MapPlace in
            let poster = PosterViewModel(id: place.id, address: place.place?.address, short_title: place.short_title,  title: place.title, description: place.description, category: place.categories, price: place.price, is_free: place.is_free, image: place.images[0].image ?? "", age_restriction: place.age_restriction as Any, site_url: place.site_url ?? "" )
            return MapPlace(title: place.short_title, subtitle: place.title, coordinate: CLLocationCoordinate2D(latitude: place.place?.coords.lat ?? 55.751244, longitude: place.place?.coords.lon ?? 37.618423), poster: poster)
        }
           
        self.mapPlaces = mapPlaces
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
}
