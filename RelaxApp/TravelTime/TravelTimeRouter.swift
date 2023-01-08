//
//  TravelTimeRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

protocol TravelTimeRouterProtocol: AnyObject {
    var viewController: TravelTimeViewController? { get set }
}

final class TravelTimeRouter: TravelTimeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: TravelTimeViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: TravelTimeViewController? = nil) {
        self.viewController = viewController
    }
}
