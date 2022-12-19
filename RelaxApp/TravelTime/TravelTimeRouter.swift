//
//  TravelTimeRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

protocol TravelTimeRouterProtocol: AnyObject {
    var viewController: TravelTimeViewProtocol? { get set }
}

final class TravelTimeRouter: TravelTimeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: TravelTimeViewProtocol?
    
//    MARK: - Lifecycle
    
    init(viewController: TravelTimeViewProtocol? = nil) {
        self.viewController = viewController
    }
}
