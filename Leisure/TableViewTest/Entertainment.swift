//
//  Product.swift
//  TableViewTest
//
//  Created by LyubaxaPro on 21.03.2021.
//

import UIKit

class Entertainment: NSObject {
    var name: String!
    var type: String!
    var info: String!
    var imagePath: String!

    convenience init(name: String, type: String, imagePath: String, info: String)  // вспомогательный конструктор
    {
        self.init()
        
        self.name = name
        self.type = type
        self.info = info
        self.imagePath = imagePath
    }

    func getImage() -> UIImage?
    {
        return UIImage(named: self.imagePath)
    }

}
