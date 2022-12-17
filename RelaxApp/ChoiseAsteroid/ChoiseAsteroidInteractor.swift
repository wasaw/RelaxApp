//
//  ChoiseAsteroidInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

protocol ChoiseAsteroidInteractorProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
}

class ChoiseAsteroidInteractor: ChoiseAsteroidInteractorProtocol {
    
//    MARK: - Properties
    
    weak var presenter: ChoiseAsteroidPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: ChoiseAsteroidPresenterProtocol? = nil) {
        self.presenter = presenter
    }
}
