//
//  StylrListViewController.swift
//  Stylr
//
//  Created by Shani Raba on 7/16/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import UIKit

class StylrListViewController: UIViewController {

    @IBOutlet weak var AllCatalogsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var catalogsViewController = CatalogItemsCollectionViewController()
        var catalogs = Catalogs.CatalogsArray[Catalogs.CurrentCatalog]
        
        // Do any additional setup after loading the view.
        //CatalogItemsCollectionView.set
        AllCatalogsCollectionView.delegate = catalogsViewController;
        AllCatalogsCollectionView.dataSource = catalogsViewController;
        
        var nibName=UINib(nibName: "CollectionViewCell", bundle:nil)
        AllCatalogsCollectionView.registerNib(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        
        AllCatalogsCollectionView.backgroundColor = UIColor.whiteColor()
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
