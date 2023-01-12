//
//  MockCompleted.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import Foundation
@testable import RelaxApp

class MockCompletedInteractor: CompletedInteractorProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.CompletedPresenterProtocol?
    var result = false
    var nickname = ""
    
//    MARK: - Helpers
    
    func loadInformation() {
        result = true
    }
    
    func deleteCompleted(nickname: String) {
        result = true
        self.nickname = nickname
    }
}

class MockCompletedView: CompletedViewProtocol {
    
//    MARK: - Properties
    
    var presenter: RelaxApp.CompletedPresenterProtocol?
    var answer: [Delivered] = []
    var result = false
    
//    MARK: - Helpers
    
    func setInformation(_ information: [RelaxApp.Delivered]) {
        self.answer = information
    }
    
    func visibleTitle() {
        self.result = true
    }
}
