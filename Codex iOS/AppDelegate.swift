//
//  AppDelegate.swift
//  Codex iOS
//
//  Created by Raymond Wong on 2020-03-21.
//  Copyright © 2020 Raymond Wong. All rights reserved.
//

import UIKit
import SQLite

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        do {
            let documentDir = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDir.appendingPathComponent("db").appendingPathExtension("sqlite3")
            let db = try Connection(fileURL.path)
            
            let products = Table("products")
            let barcode = Expression<String>("barcode")
            let description = Expression<String>("description")
            let price = Expression<Double>("price")
            let size = Expression<Double>("size")
            
            try db.run(products.create(ifNotExists: true) { t in
                t.column(barcode, primaryKey: true)
                t.column(description)
                t.column(price)
                t.column(size)
            })
            
        } catch {
            print(error)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

