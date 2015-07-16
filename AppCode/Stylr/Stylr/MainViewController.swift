//
//  MainViewController.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var CatalogItemsCollectionView: UICollectionView!
    @IBOutlet weak var HeaderImageView: UIImageView!
    
    @IBOutlet weak var CatalogName: UILabel!
    
    var catalogsViewController = CatalogItemsCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var currentCatalog = Catalogs.CatalogsArray[Catalogs.CurrentCatalog];
        
        CatalogName.text = currentCatalog.Name
        
        let image_url = NSURL(string: currentCatalog.Image)
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            let image_data = NSData(contentsOfURL: image_url!)
            
            dispatch_async(dispatch_get_main_queue()) {
                // update some UI
                let image = UIImage(data: image_data!)
                self.HeaderImageView.image = image
            }
        }
        
        
        // Do any additional setup after loading the view.
        //CatalogItemsCollectionView.set
        CatalogItemsCollectionView.delegate = catalogsViewController;
        CatalogItemsCollectionView.dataSource = catalogsViewController;
        
        var nibName=UINib(nibName: "CollectionViewCell", bundle:nil)
        CatalogItemsCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        
        CatalogItemsCollectionView.backgroundColor = UIColor.whiteColor()

       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

}
