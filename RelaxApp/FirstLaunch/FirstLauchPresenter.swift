//
//  FirstLauchPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 24.12.2022.
//

protocol FirstLaunchPresenterProtocol: AnyObject {
    var view: FirstLauchViewProtocol? { get set }
    var interactor: FirstLauchInteractorProtocol? { get set }
    var router: FirstLauchRouterProtocol? { get set }
}

final class FirstLauchPresenter: FirstLaunchPresenterProtocol {
    
//    MARK: - Properties
    weak var view: FirstLauchViewProtocol?
    var interactor: FirstLauchInteractorProtocol?
    var router: FirstLauchRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: FirstLauchViewProtocol? = nil) {
        self.view = view
    }
}
