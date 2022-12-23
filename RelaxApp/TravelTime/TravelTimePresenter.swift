//
//  TravelTimePresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

import Foundation

protocol TravelTimePresenterProtocol: AnyObject {
    var view: TravelTimeViewProtocol? { get set }
    var interactor: TravelTimeInteractorProtocol? { get set }
    var router: TravelTimeRouterProtocol? { get set }
    func presentLocalInformation(_ answer: [Asteroid])
}

final class TravelTimePresenter: TravelTimePresenterProtocol {
    
//    MARK: - Properties
    weak var view: TravelTimeViewProtocol?
    var interactor: TravelTimeInteractorProtocol?
    var router: TravelTimeRouterProtocol?
    
    private let spaceSpeed = 16.65
    private let dayInSeconds = 86400.0
    private let hourInSeconds = 3600
    private let minuteIntSeconds = 60
    
//    MARK: - Lifecycle
    
    init(view: TravelTimeViewProtocol? = nil, interactor: TravelTimeInteractorProtocol? = nil, router: TravelTimeRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
//    MARK: - Helpers
    
    func presentLocalInformation(_ answer: [Asteroid]) {
        let travelTime = countTravelTime(answer)
        view?.presentLocalInformation(asteroids: answer, travelTime: travelTime)
    }
    
    private func countTravelTime(_ asteroids: [Asteroid]) -> [TravelTime] {
        var travelTime: [TravelTime] = []
        let currentDate = Date()

        for item in asteroids {
            let timeDistance = (item.distance / spaceSpeed) / dayInSeconds
            guard let start = item.user?.start else { return [] }
            let timeInTravel = (currentDate.timeIntervalSince1970 - start) / dayInSeconds
            let progress = Float(timeInTravel / timeDistance)

            let timeLabelValueMinute = (Int(currentDate.timeIntervalSince1970 - start) % hourInSeconds) / minuteIntSeconds
            let timeLabelValueHour = (currentDate.timeIntervalSince1970 - start) / Double(hourInSeconds)
            
            var minuteString = String(timeLabelValueMinute)
            if minuteString.count == 1 {
                minuteString = "0" + minuteString
            }
            var hourString = String(format: "%.0f", timeLabelValueHour)
            if hourString.count == 1 {
                hourString = "0" + hourString
            }
            
            let travel = TravelTime(progress: progress, hour: hourString, minute: minuteString)
            travelTime.append(travel)
        }
        return travelTime
    }
}
