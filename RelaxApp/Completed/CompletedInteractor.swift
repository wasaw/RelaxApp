//
//  CompletedInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

import Foundation

protocol CompletedInteractorProtocol: AnyObject {
    var presenter: CompletedPresenterProtocol? { get set }
    func loadInformation()
    func deleteCompleted(nickname: String)
}

final class CompletedInteractor: CompletedInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: CompletedPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: CompletedPresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
//    MARK: - Helpers
    
    func loadInformation() {
        DispatchQueue.main.async {
            DatabaseService.shared.loadCompleted { response in
                switch response {
                case .success(let answer):
                    self.presenter?.setInformation(answer)
                case .failure(let error):
                    self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
        }
    }
    
    func deleteCompleted(nickname: String) {
        DispatchQueue.main.async {
            DatabaseService.shared.delete(nickname: nickname) { response in
                switch response {
                case .success(_):
                    break
                case .failure(let error):
                    self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
        }
    }
}
