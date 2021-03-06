//
//  AppDelegate.swift
//  TwitterClient
//
//  Created by Rachana Bedekar on 5/2/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        NSNotificationCenter.defaultCenter().addObserver(self, selector:("userDidLogin"), name: UserDidLoginNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:("userDidLogout"), name: UserDidLogoutNotification, object: nil)
        
        let user : User? = User.getCurrentUser()
        if (nil == user)
        {
            userDidLogout()

        } else {
            println ("Welcome user : " + user!.name!)
            userDidLogin()
        }
        return true
    }
    
    func userDidLogin(){
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let containerViewController = ContainerViewController()
        
        window!.rootViewController = containerViewController//UINavigationController(rootViewController:containerViewController)
        window!.makeKeyAndVisible()
        /*var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var tweetsViewController = storyboard.instantiateViewControllerWithIdentifier("TweetsVC")  as! TweetsViewController
        self.window?.rootViewController = UINavigationController(rootViewController: tweetsViewController)*/
    }
    
    func userDidLogout() {
        var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
        self.window?.rootViewController = UINavigationController(rootViewController: loginViewController)
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

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        TwitterClient().sharedInstance.openURL(url)
        return true;
    }
}

