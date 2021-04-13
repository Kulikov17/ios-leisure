import Foundation

protocol PosterModuleInput {
	var moduleOutput: PosterModuleOutput? { get }
}

protocol PosterModuleOutput: AnyObject {
}

protocol PosterViewInput: AnyObject {
    func reloadData()
}

protocol PosterViewOutput: AnyObject {
    
    var posterViewModels: [PosterViewModel] { get }
    func didLoadView()
    func didTapCell()
}

protocol PosterInteractorInput: AnyObject {
    func load(posters: [PosterServiceInfo])
}

protocol PosterInteractorOutput: AnyObject {
    func didLoad(posters: [Results])
}

protocol PosterRouterInput: AnyObject {
}
