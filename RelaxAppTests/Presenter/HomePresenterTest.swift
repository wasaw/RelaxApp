//
//  HomePresenter.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import XCTest
@testable import RelaxApp

final class HomePresenterTest: XCTestCase {
    
    var presenter: HomePresenterProtocol?

    override func setUp() {
        presenter = HomePresenter()
    }
    
    override func tearDown() {
        presenter = nil
    }

    
    func testSendToFlight() {
        guard let presenter = presenter else { return }
        
        let view = MockHomeView()
        presenter.view = view
        
        presenter.sendToFlight(nickname: "", describe: "")
        XCTAssertEqual("Пожалуйста, запилните все поля", view.message)
        presenter.sendToFlight(nickname: "Босс", describe: "")
        XCTAssertEqual("Пожалуйста, запилните все поля", view.message)
        presenter.sendToFlight(nickname: "", describe: "Ставит не выполнимые в срок задания")
        XCTAssertEqual("Пожалуйста, запилните все поля", view.message)
        
        presenter.sendToFlight(nickname: "Босс", describe: "Ставит не выполнимые в срок задания")
        XCTAssertTrue(view.isClear)
    }
    
    func testGetNickname() {
        guard let presenter = presenter else { return }
        
        let interactor = MockHomeInteractor()
        presenter.interactor = interactor
        presenter.getNickname()
        
        XCTAssertTrue(interactor.result)
    }
}
