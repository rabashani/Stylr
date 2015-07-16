//
//  AppDelegate.swift
//  Stylr
//
//  Created by Shani Raba on 7/15/15.
//  Copyright (c) 2015 ShopYourWay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        var catalogArray = JsonCatalogParser()
        Catalogs.CatalogsArray = catalogArray.getCatalogs()
        var catalogs:Array<Catalog> = Catalogs.CatalogsArray
        
        var controller: MainViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
//        var controller: StylrListViewController = StylrListViewController (nibName:"StylrListViewController", bundle:nil)
        
        var navController: UINavigationController = UINavigationController(rootViewController: controller)
        
        //navController.navigationBar.barStyle = UIBarStyle.Black
        
        var navBarColor = UIColor (red: 35.0/255.0, green: 190.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        navController.navigationBar.barTintColor = navBarColor
        navController.navigationBar.topItem?.title = "Stylr"
        
        let navbarFont = UIFont(name: "Noteworthy-Bold", size: 30) ?? UIFont.systemFontOfSize(30)
        navController.navigationBar.titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.blackColor()]
        
        self.window!.rootViewController = navController
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

