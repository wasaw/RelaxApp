//
//  CompletedPresenter.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import XCTest
@testable import RelaxApp

final class CompletedPresenterTest: XCTestCase {
    
    var presenter: CompletedPresenterProtocol?
    
    override func setUp() {
        presenter = CompletedPresenter()
        super.setUp()
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testCheckInformation() {
        guard let presenter = presenter else { return }

        let interactor = MockCompletedInteractor()
        presenter.interactor = interactor
        presenter.checkInformation()
        XCTAssertTrue(interactor.result)
    }
    
    func testSetInformation() {
        guard let presenter = presenter else { return }
        
        let view = MockCompletedView()
        presenter.view = view
        let delivered = Delivered(name: "34242", nickname: "Босс", describe: "Невыполнимые задания")
        let answer = [delivered]
        presenter.setInformation(answer)
        let result = view.answer[0]
        XCTAssertEqual(delivered.name, result.name)
        XCTAssertEqual(delivered.nickname, result.nickname)
        XCTAssertEqual(delivered.describe, result.describe)
    }
    
    func testDeleteSelectedItem() {
        guard let presenter = presenter else { return }
        
        let interactor = MockCompletedInteractor()
        presenter.interactor = interactor
        let nickname = "Искатель"
        presenter.deleteSelectedItem(nickname: nickname)
        XCTAssertTrue(interactor.result)
        XCTAssertEqual(nickname, interactor.nickname)
    }
    
    func testIsEmpty() {
        guard let presenter = presenter else { return }
        
        let view = MockCompletedView()
        presenter.view = view
        let delivered = Delivered(name: "34242", nickname: "Босс", describe: "Невыполнимые задания")
        let answer = [delivered]
        let answer1: [Delivered] = []
        presenter.isEmpty(answer)
        XCTAssertTrue(!view.result)
        presenter.isEmpty(answer1)
        XCTAssertTrue(view.result)
    }
}
