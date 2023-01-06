//
//  CompletedPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

protocol CompletedPresenterProtocol: AnyObject {
    var view: CompletedViewProtocol? { get set }
    var interactor: CompletedInteractorProtocol? { get set }
    var router: CompletedRouterProtocol? { get set }
}

final class CompletedPresenter: CompletedPresenterProtocol {
    
//    MARK: - Properties
    weak var view: CompletedViewProtocol?
    var interactor: CompletedInteractorProtocol?
    var router: CompletedRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: CompletedViewProtocol? = nil, interactor: CompletedInteractorProtocol? = nil, router: CompletedRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
