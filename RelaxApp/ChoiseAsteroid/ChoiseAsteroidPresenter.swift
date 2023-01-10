//
//  ChoiseAsteroidPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import Foundation

protocol ChoiseAsteroidPresenterProtocol: AnyObject {
    var view: ChoiseAsteroidViewProtocol? { get set }
    var interactor: ChoiseAsteroidInteractorProtocol? { get set }
    var router: ChoiseAsteroidRouterProtocol? { get set }
    func asteroidProcessing(asteroidInformation: AsteroidInformation, date: String)
    func setTravelTime(user: Credentials, asteroid: Asteroid)
    func getDate()
    func setDate(_ days: [Days])
    func loadInformation(date: String)
    func sort(_ asteroids: [Asteroid], direct: Bool)
    func goBack()
}

final class ChoiseAsteroidPresenter: ChoiseAsteroidPresenterProtocol {
    
//    MARK: - Properties
    
    weak var view: ChoiseAsteroidViewProtocol?
    var interactor: ChoiseAsteroidInteractorProtocol?
    var router: ChoiseAsteroidRouterProtocol?
        
    var asteroid: [Asteroid] = []
    
//    MARK: - Lifecycle
    
    init(view: ChoiseAsteroidViewProtocol? = nil, interactor: ChoiseAsteroidInteractorProtocol? = nil, router: ChoiseAsteroidRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
//    MARK: - Helpers
    
    func asteroidProcessing(asteroidInformation: AsteroidInformation, date: String) {
        asteroid = []
        let loadInformation = asteroidInformation.near_earth_objects[date]
        guard let count = loadInformation?.count else { return }
        for i in 0..<count {
            guard let id = loadInformation?[i].id else { return }
            guard let name = loadInformation?[i].name else { return }
            guard let speed = loadInformation?[i].close_approach_data[0].relative_velocity.kilometers_per_second else { return }
            guard let distanceString = loadInformation?[i].close_approach_data[0].miss_distance.kilometers.components(separatedBy: ".") else { return }
            guard let distance = Double(distanceString[0]) else { return }
            let item = Asteroid(id: id, name: name, speed: speed, distance: distance)
            asteroid.append(item)
        }
        view?.setAsteroidInformation(asteroid: asteroid)
    }
    
    func setTravelTime(user: Credentials, asteroid: Asteroid) {
        interactor?.saveDepartureInformation(user: user, asteroid: asteroid)
        router?.presentTravelTime()
    }
    
    func goBack() {
        router?.swipeBack()
    }
    
    func getDate() {
        interactor?.getDate()
    }
    
    func setDate(_ days: [Days]) {
        view?.setDate(days)
    }
    
    func loadInformation(date: String) {
        interactor?.loadInformation(date: date)
    }
    
    func sort(_ asteroids: [Asteroid], direct: Bool) {
        let result = sorted(asteroids, direct: direct)
        view?.setAsteroidInformation(asteroid: result)
    }
    
    func sorted(_ asteroids: [Asteroid], direct: Bool) -> [Asteroid] {
        asteroids.sorted { lhs, rhs in
            if direct {
                return lhs.distance < rhs.distance
            }
            return lhs.distance > rhs.distance
        }
    }
}
