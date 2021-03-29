//
//  Product.swift
//  TableViewTest
//
//  Created by LyubaxaPro on 21.03.2021.
//

import UIKit

struct Entertainment{
    let name: String
    let type: String
    let info: String
    let imagePath: String

    func getImage() -> UIImage? {
        return UIImage(named: imagePath)
    }

}
