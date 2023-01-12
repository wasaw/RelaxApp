//
//  TravelTimeTest.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import XCTest
@testable import RelaxApp

final class TravelTimePresenterTest: XCTestCase {
    
    var presenter: TravelTimePresenterProtocol?

    override func setUp() {
        presenter = TravelTimePresenter()
    }
    
    override func tearDown() {
        presenter = nil
    }
    
    func testUpdateInformation() {
        guard let presenter = presenter else { return }
        
        let interactor = MockTravelTimeInteractor()
        presenter.interactor = interactor
        presenter.updateInformation()
        XCTAssertTrue(interactor.result)
    }
    
    func testPresentLocalInformation() {
        guard let presenter = presenter else { return }
        
        let view = MockTravelTimeView()
        presenter.view = view
        let asteroid = Asteroid(id: "234234", name: "2fd3", speed: "3242", distance: 34223234)
        let answer = [asteroid]
        presenter.presentLocalInformation(answer)
        XCTAssertTrue(view.result)
    }
}
