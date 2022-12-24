//
//  FirstLauchRouter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 24.12.2022.
//

protocol FirstLauchRouterProtocol: AnyObject {
    var viewController: FirstLauchViewController? { get set }
}

final class FirstLauchRouter: FirstLauchRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: FirstLauchViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: FirstLauchViewController? = nil) {
        self.viewController = viewController
    }
}
