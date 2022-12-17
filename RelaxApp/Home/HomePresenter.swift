//
//  HomePresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func sendToFlight()
}

class HomePresenter: HomePresenterProtocol {
    
//    MARK: - Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: HomeViewProtocol? = nil) {
        self.view = view
    }
    
//    MARK: - Helpers
    
    func sendToFlight() {
        router?.presentChoiseAsteroid()
    }
}
