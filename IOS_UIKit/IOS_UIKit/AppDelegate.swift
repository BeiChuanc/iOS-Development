//
//  AppDelegate.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = UINSController()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // 应用即将进入非活跃状态
        print("应用即将进入非活跃状态")
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 应用进入后台
        print("应用进入后台")
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 应用即将进入前台
        print("应用即将进入前台")
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // 应用进入活跃状态
        print("应用进入活跃状态")
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        // 应用即将终止
        print("应用即将终止")
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IOS_UIKit")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

