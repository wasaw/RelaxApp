//
//  ChoiseAsteroidPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

protocol ChoiseAsteroidPresenterProtocol: AnyObject {
    var view: ChoiseAsteroidViewProtocol? { get set }
    var interactor: ChoiseAsteroidInteractorProtocol? { get set }
    var router: ChoiseAsteroidRouterProtocol? { get set }
    func asteroidProcessing(asteroidInformation: AsteroidInformation, date: String)
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
        let loadInformation = asteroidInformation.near_earth_objects[date]
        guard let count = loadInformation?.count else { return }
        for i in 0..<count {
            guard let id = loadInformation?[i].id else { return }
            guard let name = loadInformation?[i].name else { return }
            guard let isPotentially = loadInformation?[i].is_potentially_hazardous_asteroid else { return }
            guard let speed = loadInformation?[i].close_approach_data[0].relative_velocity.kilometers_per_hour else { return }
            guard let distance = loadInformation?[i].close_approach_data[0].miss_distance.kilometers else { return }
            let item = Asteroid(id: id, name: name, isPotentiallyHazardous: isPotentially, speed: speed, distance: distance)
            asteroid.append(item)
        }
        view?.getAsteroidInformation(asteroid: asteroid)
    }
}
