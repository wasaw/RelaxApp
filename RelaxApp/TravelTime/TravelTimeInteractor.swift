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
            DatabaseService.shared.loadInformation { answer in
                guard let answer = answer else { return }
                self.presenter?.presentLocalInformation(answer)
            }
        }
    }
    
    func completed(id: String, name: String, user: Credentials) {
        DispatchQueue.main.async {
            DatabaseService.shared.loadCompleted { result in
                for item in result {
                    if item.nickname == user.nickname {
                        return
                    }
                }
                    DatabaseService.shared.saveCompleted(id: id, name: name, user: user)
            }
        }
    }
}
