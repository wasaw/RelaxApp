//
//  TravelTimeInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

import Foundation

protocol TravelTimeInteractorProtocol: AnyObject {
    var presenter: TravelTimePresenterProtocol? { get set }
    func loadLocalInformation()
    func completed(id: String, name: String, user: Credentials)
}

final class TravelTimeInteractor: TravelTimeInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: TravelTimePresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: TravelTimePresenterProtocol? = nil) {
        self.presenter = presenter
    }
    
//    MARK: - Helpers
    
    func loadLocalInformation() {
        DispatchQueue.main.async {
            DatabaseService.shared.loadInformation { response in
                switch response {
                case .success(let answer):
                    guard let answer = answer else { return }
                    self.presenter?.presentLocalInformation(answer)
                case .failure(let error):
                    self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
        }
    }
    
    func completed(id: String, name: String, user: Credentials) {
        DispatchQueue.main.async {
            DatabaseService.shared.loadCompleted { response in
                switch response {
                case .success(let answer):
                    for item in answer {
                        if item.nickname == user.nickname {
                            return
                        }
                    }
                    DatabaseService.shared.saveCompleted(id: id, name: name, user: user) { response in
                        switch response {
                        case .success(_):
                            break
                        case .failure(let error):
                            self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                        }
                    }
                case .failure(let error):
                    self.presenter?.presentAlert(title: "Ошибка", message: error.localizedDescription)
                }
                
                
            }
        }
    }
}
