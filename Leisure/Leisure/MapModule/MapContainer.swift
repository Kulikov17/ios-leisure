//
//  MapContainer.swift
//  Leisure
//
//  Created by Дмитрий Куликов on 25.04.2021.
//  
//

import UIKit

final class MapContainer {
	let viewController: UIViewController

    private init(view: UIViewController) {
        self.viewController = view
    }
    
	class func assemble() -> MapContainer {
        let router = MapRouter()
        let interactor = MapInteractor()
        let presenter = MapPresenter(router: router, interactor: interactor)
		let viewController = MapViewController(output: presenter)

		presenter.view = viewController

		interactor.output = presenter

        return MapContainer(view: viewController)
	}
}
