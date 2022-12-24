//
//  ChoiseAsteroidInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import Foundation

protocol ChoiseAsteroidInteractorProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
    func saveDepartureInformation(user: Credentials, asteroid: Asteroid)
}

final class ChoiseAsteroidInteractor: ChoiseAsteroidInteractorProtocol {
    
//    MARK: - Properties
    
    weak var presenter: ChoiseAsteroidPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: ChoiseAsteroidPresenterProtocol? = nil) {
        self.presenter = presenter
        loadInformation()
    }
    
//    MARK: - Helpers
    
    private func loadInformation() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let currnetDateString = formatter.string(from: currentDate)
        NetworkService.shared.request(date: currnetDateString) { response in
            guard let response = response else { return }
            self.presenter?.asteroidProcessing(asteroidInformation: response, date: currnetDateString)
        }
    }
    
    func saveDepartureInformation(user: Credentials, asteroid: Asteroid) {
        DispatchQueue.main.async {
            DatabaseService.shared.saveInformation(user: user, asteroid: asteroid)
        }
    }
}
