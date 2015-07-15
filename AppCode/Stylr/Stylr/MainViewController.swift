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

    var catalogsViewController = CatalogItemsCollectionViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //CatalogItemsCollectionView.set
        CatalogItemsCollectionView.delegate = catalogsViewController;
        CatalogItemsCollectionView.dataSource = catalogsViewController;
        
        var nibName=UINib(nibName: "CollectionViewCell", bundle:nil)
        CatalogItemsCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        
        CatalogItemsCollectionView.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
