//
//  FirstLauchInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 24.12.2022.
//

protocol FirstLauchInteractorProtocol: AnyObject {
    var presenter: FirstLaunchPresenterProtocol? { get set }
}

final class FirstLauchInteractor: FirstLauchInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: FirstLaunchPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: FirstLaunchPresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
}
