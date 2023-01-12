//
//  ChoisePresenterTest.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 12.01.2023.
//

import XCTest
@testable import RelaxApp

final class ChoiseAsteroidPresenterTest: XCTestCase {
    
    var presenter: ChoiseAsteroidPresenterProtocol?

    override func setUp() {
        presenter = ChoiseAsteroidPresenter()
    }
    
    override func tearDown() {
        presenter = nil
    }
    
    func testAsteroidProcessing() {
        guard let presenter = presenter else { return }
        
        let view = MockChoiseAsteroidView()
        presenter.view = view
        
        let relativeVelocity = RevativeVelocity(kilometers_per_second: "424")
        let missDistance = MissDistance(kilometers: "324243")
        let approachData = ApproachData(relative_velocity: relativeVelocity, miss_distance: missDistance)
        let asteroudStruct = AsteridStruct(id: "2342", name: "43r23", close_approach_data: [approachData])
        let asteroidInformation = AsteroidInformation(element_count: 1, near_earth_objects: ["2023-01-12" : [asteroudStruct]])
        
        let asteroid = Asteroid(id: "2342", name: "43r23", speed: "424", distance: 324243)
        
        presenter.asteroidProcessing(asteroidInformation: asteroidInformation, date: "2023-01-12")
        XCTAssertEqual(asteroid.id, view.asteroid.id)
    }
    
    func testSetTravelTime() {
        guard let presenter = presenter else { return }
        
        let interactor = MockChoiseAsteroidInteractor()
        presenter.interactor = interactor
        let user = Credentials(nickname: "Босс", describe: "Не выполнимые в срок задачи", start: 1673551416.431777)
        let asteroid = Asteroid(id: "3395956", name: "(2007 WM3)", speed: "19.5983557702", distance: 40416889.0)
        presenter.interactor?.saveDepartureInformation(user: user, asteroid: asteroid)
        
        XCTAssertEqual(user.nickname, interactor.user.nickname)
        XCTAssertEqual(user.describe, interactor.user.describe)
        XCTAssertEqual(user.start, interactor.user.start)
        XCTAssertEqual(asteroid.id, interactor.asteroid.id)
        XCTAssertEqual(asteroid.name, interactor.asteroid.name)
        XCTAssertEqual(asteroid.speed, interactor.asteroid.speed)
        XCTAssertEqual(asteroid.distance, interactor.asteroid.distance)
    }
    
    func testGetDate() {
        guard let presenter = presenter else { return }
        
        let interactor = MockChoiseAsteroidInteractor()
        presenter.interactor = interactor
        presenter.getDate()
        XCTAssertTrue(interactor.result)
    }
    
    func testSetDate() {
        guard let presenter = presenter else { return }
        
        let view = MockChoiseAsteroidView()
        presenter.view = view
        let day = Days(day: 10, weekDay: "Вт", fullDate: "2023-01-10", selected: false)
        let days = [day]
        presenter.setDate(days)
        
        XCTAssertEqual(days[0].day, view.days[0].day)
        XCTAssertEqual(days[0].weekDay, view.days[0].weekDay)
        XCTAssertEqual(days[0].fullDate, view.days[0].fullDate)
        XCTAssertEqual(days[0].selected, view.days[0].selected)
    }
    
    func testLoadInformation() {
        guard let presenter = presenter else { return }
        
        let interactor = MockChoiseAsteroidInteractor()
        presenter.interactor = interactor
        let date = "2023-01-10"
        presenter.loadInformation(date: date)
        XCTAssertEqual(date, interactor.date)
    }
}
