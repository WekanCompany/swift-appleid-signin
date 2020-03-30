//
//  AppDelegate.swift
//  SignInWithAppleId
//
//  Created by Santhosh Kumar on 03/03/20.
//  Copyright © 2020 Santhosh Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Set RootViewController
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = (mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController)!
        navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}
