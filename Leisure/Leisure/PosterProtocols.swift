import Foundation

protocol PosterModuleInput {
	var moduleOutput: PosterModuleOutput? { get }
}

protocol PosterModuleOutput: class {
}

protocol PosterViewInput: class {
}

protocol PosterViewOutput: class {
}

protocol PosterInteractorInput: class {
}

protocol PosterInteractorOutput: class {
}

protocol PosterRouterInput: class {
}
