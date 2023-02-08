//
//  HomeInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func getNickname()
}

final class HomeInteractor: HomeInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: HomePresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: HomePresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
//    MARK: - Helpers
    
    func getNickname() {
        DispatchQueue.main.async {
            DatabaseService.shared.loadNickname { response in
                switch response {
                case .success(let result):
                    self.presenter?.setNickname(result)
                case .failure(let error):
                    self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
        }
    }
}
