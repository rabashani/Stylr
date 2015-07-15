//
//  MainViewController.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
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
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var catalogs:Array<Catalog> = getCatalogs()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    func getCatalogs() -> Array<Catalog> {
        
        let myURLString = "http://json.cowchimp.com/catalogs"
        var list:Array<Catalog> = []
        
        if let myURL = NSURL(string: myURLString) {
            var error: NSError?
            let myHTMLString = NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error) as String
            
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
            
            for json in anyObj as Array<AnyObject>{
                b.Name = (json["name"] as AnyObject? as? String) ?? "" // to get rid of null
                b.Id  =  (json["id"]  as AnyObject? as? CLong) ?? 0
                b.Image  =  (json["image"]  as AnyObject? as? String) ?? ""
                b.Items = self.parseJsonCatalogItems((json["items"] as AnyObject!!))
                
                catalogs.append(b)
            }// for
            
        } // if
        
        return catalogs
        
    }
    
    func parseJsonCatalogItems(anyObj:AnyObject) -> Array<CatalogItem>{
        
        var catalogItems:Array<CatalogItem> = []
        
        if  anyObj is Array<AnyObject> {
            
            var b:CatalogItem = CatalogItem()
            
            for json in anyObj as Array<AnyObject>{
                b.Name = (json["name"] as AnyObject? as? String) ?? "" // to get rid of null
                b.Id  =  (json["id"]  as AnyObject? as? CLong) ?? 0
                b.ImageUrl  =  (json["imageUrl"]  as AnyObject? as? String) ?? ""
                
                catalogItems.append(b)
            }// for
            
        } // if
        
        return catalogItems
        
    }
}
