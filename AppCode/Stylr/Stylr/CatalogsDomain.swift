//
//  CatalogsDomain.swift
//  Stylr
//
//  Created by Shani Raba on 7/16/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import Foundation


struct Catalog {
    var Id : CLong = 0
    var Name = ""
    var Image = ""
    var Items: [CatalogItem] = [CatalogItem]()
}

struct CatalogItem {
    var Id : CLong  = 0
    var Name = ""
    var ImageUrl = ""
    var Price: Double = 0.0
}

struct Catalogs {
    static var CatalogsArray: Array<Catalog> = Array<Catalog>()
    static var CurrentCatalog: Int = 0
}