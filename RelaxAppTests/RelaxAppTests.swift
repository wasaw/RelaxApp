//
//  RelaxAppTests.swift
//  RelaxAppTests
//
//  Created by Александр Меренков on 09.01.2023.
//

import XCTest

@testable import RelaxApp

final class RelaxAppTests: XCTestCase {
    
    func testSort() {
        let presenter = ChoiseAsteroidPresenter()
        
        let asteroid = Asteroid(id: "2226554", name: "226554 (2003 WR21)", speed: "8.9964778319", distance: 10851494.0)
        let  asteroid2 = Asteroid(id: "3157028", name: "(2003 MK4)", speed: "14.5133881189", distance: 16677866.0)
        let asteroidArray = [asteroid, asteroid2]
        let answer = presenter.sorted(asteroidArray, direct: false)
        
        let asteroidAnswer = [asteroid2, asteroid]
        
        XCTAssertEqual(answer[0].id, asteroidAnswer[0].id)
    }
    
    func testCountTravelTime() {
        let presenter = TravelTimePresenter()
        
        let user = Credentials(nickname: "user", describe: "describe", start: 1673273039)
        let user2 = Credentials(nickname: "user2", describe: "describe2", start: 1672496935.60536)
        let asteroid = Asteroid(id: "2226554", name: "226554 (2003 WR21)", speed: "8.9964778319", distance: 10851494.0, user: user)
        let  asteroid2 = Asteroid(id: "3157028", name: "(2003 MK4)", speed: "14.5133881189", distance: 16677866.0, user: user2)
        let asteroidArray = [asteroid, asteroid2]
        
        let timeInTravel = (Date().timeIntervalSince1970 - 1673273039) / 86400.0
        let timeDistance = (10851494.0 / 16.65) / 86400.0
        let progress = Float(timeInTravel / timeDistance)
        
        let answer = presenter.countTravelTime(asteroidArray)
        
        XCTAssertEqual(answer[0].progress, progress)
    }
    
    func testLoadNickname() {
        let database = DatabaseService.shared
        
        database.loadNickname { answer in
            XCTAssert(answer.contains("Босс"))
        }
    }
    
    func testLoadCompleted() {
        let database = DatabaseService.shared
        
        database.loadCompleted { answer in
            XCTAssert(answer.isEmpty || answer[0].nickname == "Попутчик")
        }
    }

}
