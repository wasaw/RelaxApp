//
//  ChoiseMock.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import Foundation
@testable import RelaxApp


class MockChoiseAsteroidView: ChoiseAsteroidViewProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.ChoiseAsteroidPresenterProtocol?
    var asteroid = Asteroid(id: "", name: "", speed: "", distance: 0)
    var days: [Days] = []
    
//    MARK: - Helpers
    
    func setAsteroidInformation(asteroid: [RelaxApp.Asteroid]) {
        self.asteroid = asteroid[0]
    }
    
    func setDate(_ days: [RelaxApp.Days]) {
        self.days = days
    }
}

class MockChoiseAsteroidInteractor: ChoiseAsteroidInteractorProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.ChoiseAsteroidPresenterProtocol?
    var result = false
    var user = Credentials(nickname: "", describe: "", start: 0)
    var asteroid = Asteroid(id: "", name: "", speed: "", distance: 0)
    var date = ""
    
//    MARK: - Lifecycle
    
    func getDate() {
        self.result = true
    }
    
    func saveDepartureInformation(user: RelaxApp.Credentials, asteroid: RelaxApp.Asteroid) {
        self.user = user
        self.asteroid = asteroid
    }
    
    func loadInformation(date: String) {
        self.date = date
    }
}
