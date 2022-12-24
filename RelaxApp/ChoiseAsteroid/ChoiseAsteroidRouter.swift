//
//  ChoiseAsteroidRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

protocol ChoiseAsteroidRouterProtocol: AnyObject {
    var viewController: ChoiseAsteroidViewController? { get set }
    func presentTravelTime()
}

final class ChoiseAsteroidRouter: ChoiseAsteroidRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: ChoiseAsteroidViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: ChoiseAsteroidViewController? = nil) {
        self.viewController = viewController
    }
    
//    MARK: - Helpers
    
    func presentTravelTime() {
        viewController?.dismiss(animated: true)
    }
}
