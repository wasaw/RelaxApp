//
//  HomeMock.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import Foundation
@testable import RelaxApp

class MockHomeView: HomeViewProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.HomePresenterProtocol?
    var message = ""
    var isClear = false
    
//    MARK: - Helpers
    
    func setAlert(_ message: String) {
        self.message = message
    }
    
    func clearLabel() {
        self.isClear = true
    }
}

class MockHomeInteractor: HomeInteractorProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.HomePresenterProtocol?
    var result = false
    
//    MARK: - Helpers
    
    func getNickname() {
        self.result = true
    }
}
