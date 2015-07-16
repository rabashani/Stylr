//
//  StylrCatalogsCollectionViewController.swift
//  Stylr
//
//  Created by Shani Raba on 7/16/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//


import Foundation
import UIKit

class StylrCatalogsCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        return Catalogs.CatalogsArray.count
    }
    
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
        -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        let item = Catalogs.CatalogsArray[indexPath.row]
        cell.title.text = item.Name
        
        
        let image_url = NSURL(string: item.Image)
        
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