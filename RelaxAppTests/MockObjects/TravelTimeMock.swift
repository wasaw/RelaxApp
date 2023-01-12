//
//  MockTravelTime.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import Foundation
@testable import RelaxApp

class MockTravelTimeInteractor: TravelTimeInteractorProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.TravelTimePresenterProtocol?
    var result = false
    
//    MARK: - Helpers
    
    func loadLocalInformation() {
        self.result = true
    }
    
    func completed(id: String, name: String, user: RelaxApp.Credentials) {
        
    }
}

class MockTravelTimeView: TravelTimeViewProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.TravelTimePresenterProtocol?
    var result = false
    
//    MARK: - Helpers
    
    func presentLocalInformation(asteroids: [RelaxApp.Asteroid], travelTime: [RelaxApp.TravelTime]) {
        self.result = true
    }
}
