import Foundation

final class PosterInteractor {
	weak var output: PosterInteractorOutput?
    
    private let postersManager: PostersManagerDescription = PostersManager.shared
}

extension PosterInteractor: PosterInteractorInput {
    func load(posters: PosterServiceInfo) {
        postersManager.load(posters: posters) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posters):
                    self?.output?.didLoad(posters: posters)
                case .failure(let error):
                    self?.output?.didReceive(error: error)
                }
            }
        }
    }
}
