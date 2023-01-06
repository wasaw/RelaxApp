//
//  CompletedInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

protocol CompletedInteractorProtocol: AnyObject {
    var presenter: CompletedPresenterProtocol? { get set }
}

final class CompletedInteractor: CompletedInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: CompletedPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: CompletedPresenterProtocol? = nil) {
        self.presenter = presenter
    }
}
