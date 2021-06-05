import Foundation

final class MapInteractor {
	weak var output: MapInteractorOutput?
    
    private let mapManager: MapManagerDescription = MapManager.shared
}

extension MapInteractor: MapInteractorInput {
    func load(places: MapServiceInfo) {
        mapManager.load(places: places) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let places):
                    self?.output?.didLoad(places: places)
                case .failure(let error):
                    self?.output?.didReceive(error: error)
                }
            }
        }
    }
}
