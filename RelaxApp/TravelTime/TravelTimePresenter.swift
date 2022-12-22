//
//  TravelTimePresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

protocol TravelTimePresenterProtocol: AnyObject {
    var view: TravelTimeViewProtocol? { get set }
    var interactor: TravelTimeInteractorProtocol? { get set }
    var router: TravelTimeRouterProtocol? { get set }
    func presentLocalInformation(_ ansewer: [Asteroid])
}

final class TravelTimePresenter: TravelTimePresenterProtocol {
    
//    MARK: - Properties
    weak var view: TravelTimeViewProtocol?
    var interactor: TravelTimeInteractorProtocol?
    var router: TravelTimeRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: TravelTimeViewProtocol? = nil, interactor: TravelTimeInteractorProtocol? = nil, router: TravelTimeRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
//    MARK: - Helpers
    
    func presentLocalInformation(_ ansewer: [Asteroid]) {
        view?.presentLocalInformation(asteroids: ansewer)
    }
}
