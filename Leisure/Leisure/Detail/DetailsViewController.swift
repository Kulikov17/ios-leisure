import UIKit
import WebKit

class DetailsViewController: UIViewController {
    private var poster: PosterViewModel?
    
    init(poster: PosterViewModel){
        self.poster = poster
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        poster = nil

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = poster?.short_title
    }
    
    override func loadView() {
        view = DetailView(poster: poster ?? PosterViewModel(address: "", short_title: "", title: "", description: "", category: [], price: "", is_free: false, image: "", age_restriction: "", site_url: ""))
        }
}
