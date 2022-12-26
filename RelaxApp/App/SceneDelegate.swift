//
//  SceneDelegate.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let isFirstLauch = UserDefaults.standard.bool(forKey: "isFirstLauch")
//        if isFirstLauch {
//            window?.rootViewController = FirstLauchViewController()
//        } else {
//            window?.rootViewController = TabBarController()
//            UserDefaults.standard.set(true, forKey: "isFirstLauch")
//        }
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
    }
}

