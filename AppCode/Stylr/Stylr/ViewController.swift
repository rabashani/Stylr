//
//  ViewController.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Put this setup code in the viewDidLoad method.
        addCatalogMainImageView()
    }

    func addCatalogMainImageView(){
        // Put this setup code in the viewDidLoad method.
        self.view.backgroundColor = UIColor.yellowColor()
        let imageName = "yourimage.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x:0, y:0, width:100, height:200)
        self.view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

