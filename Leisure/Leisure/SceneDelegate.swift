import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarViewController = UITabBarController()
        
        
        let navigationController = UINavigationController(rootViewController: tabBarViewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        let posterContainer = PosterContainer.assemble()
        let posterViewControllerFromContainer = posterContainer.viewController
        
        let posterViewController = UINavigationController(rootViewController: posterViewControllerFromContainer)
        
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let eventsViewController = UINavigationController(rootViewController: EventsViewController())
        
        let mapContainer = MapContainer.assemble()
        let mapViewControllerFromContainer = mapContainer.viewController
        
        let mapViewController = UINavigationController(rootViewController: mapViewControllerFromContainer)
        mapViewController.setNavigationBarHidden(true, animated: false)
        
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
        posterViewController.title = "Афиша"
        searchViewController.title = "Поиск"
        eventsViewController.title = "События"
        mapViewController.title = "Карта"
        profileViewController.title = "Профиль"
        
        tabBarViewController.setViewControllers([posterViewController, searchViewController, eventsViewController, mapViewController, profileViewController], animated: false)
        
        guard let items = tabBarViewController.tabBar.items else {
            return
        }
        
        let images = ["star", "magnifyingglass", "calendar", "map", "person.crop.circle"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        //tabBarVC.modalPresentationStyle = .fullScreen
       // present(tabBarVC, animated: true)
        
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

