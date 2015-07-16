//
//  JsonCatalogParser.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import Foundation

class JsonCatalogParser{
    
    func getCatalogs() -> Array<Catalog> {
        
        let myURLString = "http://www.shopyourway.com/__/catalogs/get-catalog-items-by-tag?TagId=18064860"
        var list:Array<Catalog> = []
        
        if let myURL = NSURL(string: myURLString) {
            var error: NSError?
            let myHTMLString = NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error) as! String
            
            // convert String to NSData
            var data: NSData = myHTMLString.dataUsingEncoding(NSUTF8StringEncoding)!
            
            // convert NSData to 'AnyObject'
            let anyObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0),
                error: &error)
            println("Error: \(error)")
            
            // convert 'AnyObject' to Array<Business>
            list = self.parseJsonCatalog(anyObj!)
        } else {
            println("Error: \(myURLString) doesn't seem to be a valid URL")
        }
        
        return list
    }
    
    func parseJsonCatalog(anyObj:AnyObject) -> Array<Catalog>{
        
        var catalogs:Array<Catalog> = []
        
        if  anyObj is Array<AnyObject> {
            
            var b:Catalog = Catalog()
            
            for json in anyObj as! Array<AnyObject>{
                b.Name = (json["CatalogName"] as AnyObject? as? String) ?? "" // to get rid of null
                b.Id  =  (json["CatalogId"]  as AnyObject? as? CLong) ?? 0
                b.Image  =  (json["catalogImageUrl"]  as AnyObject? as? String) ?? ""
                b.Items = self.parseJsonCatalogItems((json["VisualItems"] as AnyObject!!))
                
                catalogs.append(b)
            }// for
            
        } // if
        
        return catalogs
        
    }
    
    func parseJsonCatalogItems(anyObj:AnyObject) -> Array<CatalogItem>{
        
        var catalogItems:Array<CatalogItem> = []
        
        if  anyObj is Array<AnyObject> {
            
            var b:CatalogItem = CatalogItem()
            
            for json in anyObj as! Array<AnyObject>{
                b.Name = (json["Name"] as AnyObject? as? String) ?? "" // to get rid of null
                b.Id  =  (json["ItemId"]  as AnyObject? as? CLong) ?? 0
                b.ImageUrl  =  (json["ImageUrl"]  as AnyObject? as? String) ?? ""
                
                catalogItems.append(b)
            }// for
            
        } // if
        
        return catalogItems
        
    }
}
