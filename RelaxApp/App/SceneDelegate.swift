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
//  Внесем первоначальные данные, для лучшей презентации приложения
        
            DispatchQueue.main.async {
                let user = Credentials(nickname: "Босс", describe: "Унижение и оскорбление", start: 1673273039)
                let user2 = Credentials(nickname: "Дедлайн", describe: "Все более поджимающие сроки", start: 1672496935.60536)
                let user3 = Credentials(nickname: "Попутчик", describe: "Перепалка в общественном транспорте", start: 1671979259.43678)
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
        window?.makeKeyAndVisible()
    }
}

