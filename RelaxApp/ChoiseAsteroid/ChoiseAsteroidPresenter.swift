//
//  ChoiseAsteroidPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

protocol ChoiseAsteroidPresenterProtocol: AnyObject {
    var view: ChoiseAsteroidViewProtocol? { get set }
    var interactor: ChoiseAsteroidInteractorProtocol? { get set }
    var router: ChoiseAsteroidRouterProtocol? { get set }
}

class ChoiseAsteroidPresenter: ChoiseAsteroidPresenterProtocol {
    
//    MARK: - Properties
    
    weak var view: ChoiseAsteroidViewProtocol?
    var interactor: ChoiseAsteroidInteractorProtocol?
    var router: ChoiseAsteroidRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: ChoiseAsteroidViewProtocol? = nil, interactor: ChoiseAsteroidInteractorProtocol? = nil, router: ChoiseAsteroidRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
