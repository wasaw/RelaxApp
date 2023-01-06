//
//  CompletedRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

protocol CompletedRouterProtocol: AnyObject {
    var viewController: CompletedViewController? { get set }
}

final class CompletedRouter: CompletedRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: CompletedViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: CompletedViewController? = nil) {
        self.viewController = viewController
    }
}
