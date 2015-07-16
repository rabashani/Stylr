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
    
    var catalogsViewController = CatalogItemsCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //CatalogItemsCollectionView.set
        CatalogItemsCollectionView.delegate = catalogsViewController;
        CatalogItemsCollectionView.dataSource = catalogsViewController;
        
        var nibName=UINib(nibName: "CollectionViewCell", bundle:nil)
        CatalogItemsCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        
        CatalogItemsCollectionView.backgroundColor = UIColor.whiteColor()

        var catalogArray = JsonCatalogParser()
        var catalogs:Array<JsonCatalogParser.Catalog> = catalogArray.getCatalogs()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

}
