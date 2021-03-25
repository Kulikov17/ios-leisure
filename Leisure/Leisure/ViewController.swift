//
//  ViewController.swift
//  TableViewTest
//
//  Created by LyubaxaPro on 21.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let tabBarVC = UITabBarController()
        
        let posterViewController = UINavigationController(rootViewController: PosterViewController())
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

