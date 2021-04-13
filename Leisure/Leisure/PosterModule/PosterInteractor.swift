import Foundation

final class PosterInteractor {
	weak var output: PosterInteractorOutput?
}

extension PosterInteractor: PosterInteractorInput {
    func load(posters: [PosterServiceInfo]) {
        let loader = PosterServiceLoader(posters: posters)
        let urlString = loader.posterUrl()
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, !data.isEmpty else {
                //print("No data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let responcePosters = try decoder.decode(Responce.self, from: data)
                
                DispatchQueue.main.async {
                    self.output?.didLoad(posters: responcePosters.results)
                }
                print(responcePosters)

            } catch let error {
                print(error.localizedDescription)
                return
            }

            
        }.resume()
    }
    
}
