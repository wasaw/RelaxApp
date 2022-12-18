//
//  HomeRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    var viewController: HomeViewController? { get set }
    func presentChoiseAsteroid()
}

final class HomeRouter: HomeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: HomeViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: HomeViewController? = nil) {
        self.viewController = viewController
    }
    
//    MARK: - Helpers
    
    func presentChoiseAsteroid() {
        let vc = ChoiseAsteroidViewController()
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
