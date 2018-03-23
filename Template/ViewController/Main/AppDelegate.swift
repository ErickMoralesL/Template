 //
//  AppDelegate.swift
//  Template
//
//  Created by Erick Alberto Morales Ledesma on 11/02/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import TwitterKit
import GoogleSignIn

protocol AppDelegateGoogleDelegate {
    func signSucces(user: GIDGoogleUser!, error: Error?);
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    var delegate: AppDelegateGoogleDelegate?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Facebook Configutarion
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //FireBase configuration
        FirebaseApp.configure()
        
        //GoogleIn
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        #if DEVELOPMENT
            let TWApiKey = "vbAHBBJX8VWmgHxk8QD9VHa9x"
            let TWApiScret = "VvdaNDEvj8XcHO2GVMiqQwldxSthBdP6VotkUVJgSwFrTIYxzl"
        #else
            let TWApiKey = "3v9ukT9LtIUn0COT8LXW9YxI9"
            let TWApiScret = "vWnXfc7DMiu9CXb9usMofgzxOEDw7leTXCljjO25R1fU2LabLy"
        #endif
        
        //Twitter
        TWTRTwitter.sharedInstance().start(withConsumerKey: TWApiKey, consumerSecret: TWApiScret)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainView")
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        #if DEVELOPMENT
            let FBScheme = "fb1463078320469905"
            let TWScheme = "twitterkit-vbahbbjx8vwmghxk8qd9vha9x"
        #else
            let FBScheme = "fb1919057438405293"
            let TWScheme = "twitterkit-3v9ukt9ltiun0cot8lxw9yxi9"
        #endif
        
        if (url.scheme == TWScheme)
        {
            return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        }else if (url.scheme == FBScheme){
            let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app,
                                                                                      open: url,
                                                                                      sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
                                                                                      annotation: options[UIApplicationOpenURLOptionsKey.annotation] as! String)
            
             return handled
        }else{
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
        }
        
    }
    
    //MARK: - Google Delgate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        self.delegate?.signSucces(user: user, error: error)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        self.delegate?.signSucces(user: user, error: error)
    }
    
}

