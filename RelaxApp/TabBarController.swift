//
//  TapBarController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 19.12.2022.
//

import UIKit

class TabBarController: UITabBarController {

//    MARK: - Lifecycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let lessWidth: CGFloat = (view.frame.height < 700) ? 20 : 40
        let lessHeight: CGFloat = (view.frame.height < 700) ? 3 : 20
        tabBar.frame.size.width = view.frame.width - lessWidth
        tabBar.frame.size.height = tabBar.frame.size.height - lessHeight
        tabBar.frame.origin.y = tabBar.frame.origin.y - lessHeight / 2
        tabBar.frame.origin.x = lessWidth / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .background
        tabBar.tintColor = .textColor
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.cornerRadius = 10
        tabBar.layer.borderWidth = 0.7
        tabBar.layer.borderColor = UIColor.lightGray.cgColor

        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = UIImage(named: "play")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.title = "Домашняя"
        homeVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)

        let travelVC = TravelTimeViewController()
        travelVC.tabBarItem.image = UIImage(named: "track")?.withRenderingMode(.alwaysOriginal)
        travelVC.tabBarItem.title = "Отслеживание"
        travelVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        let completedVC = CompletedViewController()
        completedVC.tabBarItem.image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
        completedVC.tabBarItem.title = "Завершенные"
        completedVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)

        viewControllers = [homeVC, travelVC, completedVC]
    }
}
