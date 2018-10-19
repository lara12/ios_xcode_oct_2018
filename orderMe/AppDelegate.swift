//
//  AppDelegate.swift
//  iOrder
//
//  Created by Boris Gurtovyy on 29.03.16.
//  Copyright © 2016 Boris Gurtovoy. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        self.window?.tintColor = Constants.mainThemeColor
        
        Fabric.with([Crashlytics.self])
        return true
    }
    
    
    func clearUserDefaults() {
        let appDomainOpt: String? = Bundle.main.bundleIdentifier
        guard let appDomain = appDomainOpt else { return }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        let folders: [Any] = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let fm = FileManager()
        for path in folders {
            guard let path = path as? String else { continue }
            try? fm.removeItem(atPath: path)
        }
        let folders_document: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fm1 = FileManager()
        for path in folders_document {
            guard let path = path as? String else { continue }
            try? fm1.removeItem(atPath: path)
        }
    }


    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
        
        let isFBURL = ((url.scheme?.hasPrefix("fb\(SDKSettings.appId)"))! && url.host == "authorize")
        if  isFBURL == true {
            let options: [UIApplicationOpenURLOptionsKey: Any] = [
                .sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication]!,
                .annotation: options[UIApplicationOpenURLOptionsKey.annotation]!
            ]
            return SDKApplicationDelegate.shared.application(application, open: url, options: options)
        }
        return false
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }

}

