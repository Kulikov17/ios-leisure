import Foundation

final class PosterPresenter {
	weak var view: PosterViewInput?
	private let router: PosterRouterInput
	private let interactor: PosterInteractorInput
    private var categories: [String] = []
    private var locationServiceInfos: PosterServiceInfo = PosterServiceInfo(location:"msk", category: [])
    


    init(router: PosterRouterInput, interactor: PosterInteractorInput) {
        self.router = router
        self.interactor = interactor
       
    }

    func setLocationService(location: String, categories: [String]){
        self.locationServiceInfos.location = location
        self.locationServiceInfos.category = categories
    }
    
    private (set) var postersViewModels: [PosterViewModel] = []
    var filteredPostersViewModels: [PosterViewModel] = []
}


extension PosterPresenter: PosterViewOutput {
    
    func didLoadView() {
        setLocationService(location: "msk", categories: categories)
        interactor.load(posters: locationServiceInfos)
    }
    
    func didPullRefresh() {
        interactor.load(posters: locationServiceInfos)
    }
    
    func didTapCell(at index: Int) {
        let model = postersViewModels[index]
        router.showPoster(model: model)
        
    }
    
    func didTapFilter() {
        router.openFilter()
    }
    
    func setCategories(categories: [String]){
        
        self.categories = categories
        setLocationService(location: "msk", categories: categories)
    }
}

extension PosterPresenter: PosterInteractorOutput {
    func didLoad(posters: [PosterResults]) {
        let postersViewModels = posters.map { poster in
            return PosterViewModel(address: poster.place?.address, short_title: poster.short_title,  title: poster.title, description: poster.description, category: poster.categories[0], price: poster.price, is_free: poster.is_free, image: poster.images[0].image ?? "", age_restriction: poster.age_restriction as Any, site_url: poster.site_url ?? "" )
           
        }
           
        self.postersViewModels = postersViewModels
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        print(error)
    }
}
