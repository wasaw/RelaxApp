//
//  AppDelegate.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
           
        } else {
            self.window = UIWindow()
            let isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
            if isLaunchedBefore {
                window?.rootViewController = TabBarController()
            } else {
                window?.rootViewController = FirstLauchViewController()
                UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
            }
            self.window?.makeKeyAndVisible()
        }   
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //    MARK: - Core Data stack
        
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Model")
            container.loadPersistentStores(completionHandler: {(storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolver error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        
    //    MARK: - Core Data Saving support
        
        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolver error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}

