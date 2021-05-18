import Foundation

enum NetworkError: Error {
    case unexpected
}

protocol PostersManagerDescription: AnyObject {
    func load(posters: PosterServiceInfo, completion: @escaping (Result<[PosterResults], Error>) -> Void)
}

final class PostersManager: PostersManagerDescription {
    
    static let shared: PostersManagerDescription = PostersManager()
    
    private init() {}
    
    func load(posters: PosterServiceInfo, completion: @escaping (Result<[PosterResults], Error>) -> Void) {
        let loader = PosterServiceLoader(posters: posters)
        let urlString = loader.posterUrl()
                
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.unexpected))
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
                let response = try decoder.decode(PosterResponce.self, from: data)
                completion(.success(response.results))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

