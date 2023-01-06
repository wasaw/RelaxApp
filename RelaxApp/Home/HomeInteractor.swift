//
//  HomeInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func isFirstLaunch()
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
        DispatchQueue.main.async {
            DatabaseService.shared.isEmpty { answer in
                self.presenter?.launchView(isFirst: answer)
            }
        }
    }
}
