//
//  AppDelegate.swift
//  ImpossibleRush
//
//  Created by Nguyen Dac Phuoc on 9/17/15.
//  Copyright (c) 2015 Game Developer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , UINavigationControllerDelegate, JPUSHRegisterDelegate/*, ChartboostDelegate*/ {
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        
    }
    

    var window: UIWindow?
    var _url: String?;
    var _updateUrl: String?
    var responseData: NSMutableData!
    var navigationController:UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
   
        let advertisingId = ASIdentifierManager.shared()?.advertisingIdentifier.uuidString
        
        JPUSHService.setup(withOption: launchOptions,
                           appKey: "5abfe41870ddfe53716ec3fb",
                           channel: "Rotation",
                           apsForProduction:true,
                           advertisingIdentifier: advertisingId)
        
        JANALYTICSService.crashLogON()

        let config = JANALYTICSLaunchConfig.init()
        config.appKey = "46ac7aef2b47a956ea2726f3"
       JANALYTICSService.setup(with: config);
        JANALYTICSService.setDebug(false);
        JANALYTICSService.setFrequency(0);
        
        let userDefaults = UserDefaults.standard;//[NSUserDefaults standardUserDefaults];
        _url = userDefaults.string(forKey:"url");

        UIUtil.initAppDelegate();
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let reach = Reachability.forInternetConnection()
        if !reach!.isReachable()
        {
            let viewController = SplashViewController.init()
            window?.rootViewController = viewController;
            window?.makeKeyAndVisible()
        }
        
        //reachabilityForInternetConnection
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
       UIUtil.appeComeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

