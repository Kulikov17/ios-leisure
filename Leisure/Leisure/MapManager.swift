import Foundation

enum MapNetworkError: Error {
    case unexpected
}

protocol MapManagerDescription: AnyObject {
    func load(places: [MapServiceInfo], completion: @escaping (Result<[MapResults], Error>) -> Void)
}

final class MapManager: MapManagerDescription {
    
    static let shared: MapManagerDescription = MapManager()
    
    private init() {}
    
    func load(places: [MapServiceInfo], completion: @escaping (Result<[MapResults], Error>) -> Void) {
        let loader = MapServiceLoader(places: places)
        let urlString = loader.mapInfoUrl()
                
        guard let url = URL(string: urlString) else {
            completion(.failure(MapNetworkError.unexpected))
            return
        }
                
        let urlRequest = URLRequest(url: url)
                
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
                    
            guard let data = data else {
                completion(.failure(NetworkError.unexpected))
                return
            }
                    
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(MapResponce.self, from: data)
                completion(.success(response.results))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
