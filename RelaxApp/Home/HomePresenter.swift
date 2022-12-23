//
//  HomePresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func sendToFlight(nickname: String, describe: String)
    func isFirstLaunch()
    func launchView(isFirst: Bool)
    func saveLocalInformation(user: Credentials)
}

final class HomePresenter: HomePresenterProtocol {
    
//    MARK: - Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: HomeViewProtocol? = nil) {
        self.view = view
    }
    
//    MARK: - Helpers
    
    func sendToFlight(nickname: String, describe: String) {
        let currentDate = Date().timeIntervalSince1970
        let user = Credentials(nickname: nickname, describe: describe, start: currentDate)
        router?.presentChoiseAsteroid(for: user)
    }
    
    func isFirstLaunch() {
        interactor?.isFirstLaunch()
    }
    
    func launchView(isFirst: Bool) {
        view?.launchView(isFirst)
    }
    
    func saveLocalInformation(user: Credentials) {
        interactor?.saveLocalInformation(user)
    }
}
