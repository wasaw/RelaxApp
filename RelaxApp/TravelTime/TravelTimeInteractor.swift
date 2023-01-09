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
    func completed(id: String, name: String, nickname: String)
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
    
    func completed(id: String, name: String, nickname: String) {
        DispatchQueue.main.async {
            DatabaseService.shared.saveCompleted(id: id, name: name, nickname: nickname)
        }
    }
}
