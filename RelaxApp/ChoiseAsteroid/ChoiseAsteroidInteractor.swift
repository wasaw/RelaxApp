//
//  ChoiseAsteroidInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import Foundation

protocol ChoiseAsteroidInteractorProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
    func getDate()
    func saveDepartureInformation(user: Credentials, asteroid: Asteroid)
    func loadInformation(date: String)
}

final class ChoiseAsteroidInteractor: ChoiseAsteroidInteractorProtocol {
    
//    MARK: - Properties
    
    weak var presenter: ChoiseAsteroidPresenterProtocol?
    
    private let dayInSeconds = 86400.0
    private let formatter = DateFormatter()
    
//    MARK: - Lifecycle
    
    init(presenter: ChoiseAsteroidPresenterProtocol? = nil) {
        self.presenter = presenter
        formatter.dateFormat = "yyyy-MM-dd"
        loadInformation(date: "")
    }
    
//    MARK: - Helpers
    
    func getDate() {
        var days: [Days] = []
        for i in -2...2 {
            let nowDay = Calendar.current.component(.day, from: Date() + dayInSeconds * Double(i))
            guard let fullDate = Calendar.current.date(byAdding: .day, value: i, to: Date()) else { return }
            let selectedDay = i == 0 ? true : false
            let day = Days(day: nowDay, fullDate:  formatter.string(from: fullDate), selected: selectedDay)
            days.append(day)
        }
        presenter?.setDate(days)
    }
    
    func loadInformation(date: String) {
        var currnetDateString = ""
        if date.isEmpty {
            let currentDate = Date()
            currnetDateString = formatter.string(from: currentDate)
        } else {
            currnetDateString = date
        }
        NetworkService.shared.request(date: currnetDateString) { response in
            guard let response = response else { return }
            self.presenter?.asteroidProcessing(asteroidInformation: response, date: currnetDateString)
        }
    }
    
    func saveDepartureInformation(user: Credentials, asteroid: Asteroid) {
        DispatchQueue.main.async {
            DatabaseService.shared.saveInformation(user: user, asteroid: asteroid)
        }
    }
}
