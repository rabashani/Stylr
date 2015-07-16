//
//  CatalogItemsCollectionView.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import Foundation
import UIKit

let reuseIdentifier = "CollectionViewCell"

class CatalogItemsCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    let titles = ["Sand Harbor, Lake Tahoe - California","Beautiful View of Manhattan skyline.","Watcher in the Fog","Great Smoky Mountains National Park, Tennessee","Most beautiful place"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //#warning Incomplete method implementation -- Return the number of sections
    return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //#warning Incomplete method implementation -- Return the number of items in the section
        return Catalogs.CatalogsArray[Catalogs.CurrentCatalog].Items.count
    }
    


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
        -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
    
        let item = Catalogs.CatalogsArray[Catalogs.CurrentCatalog].Items[indexPath.row]
        cell.title.text = item.Name
        
        
//        let image_url = NSURL(string: item.ImageUrl)
//        let image_data = NSData(contentsOfURL: image_url!)
//        let image = UIImage(data: image_data!)
//        cell.imageView.image = image
        
      
        let image_url = NSURL(string: item.ImageUrl)
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            let image_data = NSData(contentsOfURL: image_url!)
            
            dispatch_async(dispatch_get_main_queue()) {
                // update some UI
                let image = UIImage(data: image_data!)
                cell.imageView.image = image
            }
        }
        
        
        
        return cell
        
        /*let title = self.titles[indexPath.row % 5]
        cell.title.text = title
        
        let curr = indexPath.row % 5  + 1
        let imgName = "pin\(curr).jpg"
        cell.imageView.image = UIImage(named: imgName)
    
        return cell*/
    }

    /*
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
    return CGSize(width: 170, height: 300)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return sectionInsets
    }
*/
    
}