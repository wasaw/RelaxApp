//
//  HomeRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

protocol HomeRouterProtocol: AnyObject {
    var viewController: HomeViewProtocol? { get set }
}

class HomeRouter: HomeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: HomeViewProtocol?
    
//    MARK: - Lifecycle
    
    init(viewController: HomeViewProtocol? = nil) {
        self.viewController = viewController
    }
}
