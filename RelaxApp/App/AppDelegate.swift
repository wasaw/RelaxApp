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
//  Внесем первоначальные данные, для лучшей презентации приложения
        
                DispatchQueue.main.async {
                    let user = Credentials(nickname: "Главный", describe: "Хочется отвязаться от навязчивой мысли", start: 1673273039)
                    let user2 = Credentials(nickname: "Повторный", describe: "Забыл причину", start: 1672496935.60536)
                    let user3 = Credentials(nickname: "Давный", describe: "Отправлен в прошлом месяце", start: 1671979259.43678)
                    let asteroid = Asteroid(id: "2226554", name: "226554 (2003 WR21)", speed: "8.9964778319", distance: 10851494.0)
                    let  asteroid2 = Asteroid(id: "3157028", name: "(2003 MK4)", speed: "14.5133881189", distance: 16677866.0)
                    let asteroid3 = Asteroid(id: "3646649", name: "(2013 QM10)", speed: "16.5596181201", distance: 21000648.0)
                    DatabaseService.shared.saveInformation(user: user, asteroid: asteroid)
                    DatabaseService.shared.saveInformation(user: user2, asteroid: asteroid2)
                    DatabaseService.shared.saveInformation(user: user3, asteroid: asteroid3)
                }
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

