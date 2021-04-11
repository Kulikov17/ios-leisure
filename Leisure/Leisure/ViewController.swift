import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tabBarVC = UITabBarController()
        
        let container = PosterContainer.assemble()
        let viewController = container.viewController
        
        let posterViewController = UINavigationController(rootViewController: viewController)
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let eventsViewController = UINavigationController(rootViewController: EventsViewController())
        let mapViewController = UINavigationController(rootViewController: MapViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
        posterViewController.title = "Афиша"
        searchViewController.title = "Поиск"
        eventsViewController.title = "События"
        mapViewController.title = "Карта"
        profileViewController.title = "Профиль"
        
        tabBarVC.setViewControllers([posterViewController, searchViewController, eventsViewController, mapViewController, profileViewController], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["star", "magnifyingglass", "calendar", "map", "person.crop.circle"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        // Do any additional setup after loading the view.
    }


}

