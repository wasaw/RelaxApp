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
        let isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
        if isLaunchedBefore {
            window?.rootViewController = TabBarController()
        } else {
            window?.rootViewController = FirstLauchViewController()
            UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
        }
//        window?.rootViewController = FirstLauchViewController()
        window?.makeKeyAndVisible()
    }
}

