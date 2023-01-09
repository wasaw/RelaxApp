//
//  HomeRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    var viewController: HomeViewController? { get set }
    func presentChoiseAsteroid(for user: Credentials)
}

final class HomeRouter: HomeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: HomeViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: HomeViewController? = nil) {
        self.viewController = viewController
    }
    
//    MARK: - Helpers
    
    func presentChoiseAsteroid(for user: Credentials) {
        let vc = UINavigationController(rootViewController: ChoiseAsteroidViewController(user: user))
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
