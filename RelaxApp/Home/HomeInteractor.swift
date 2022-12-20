//
//  HomeInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func isFirstLaunch()
    func saveLocalInformation(_ user: Credentials)
}

final class HomeInteractor: HomeInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: HomePresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: HomePresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
//    MARK: - Helpers
    
    func isFirstLaunch() {
        let answer = DatabaseService.shared.isEmpty()
        presenter?.launchView(isFirst: answer)
    }
    
    func saveLocalInformation(_ user: Credentials) {
        
    }
}
