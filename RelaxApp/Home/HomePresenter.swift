//
//  HomePresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func sendToFlight(nickname: String, describe: String)
    func getNickname()
    func setNickname(_ result: Set<String>)
}

final class HomePresenter: HomePresenterProtocol {
    
//    MARK: - Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol? {
        didSet {
            getNickname()
        }
    }
    var router: HomeRouterProtocol?
    
    var nicknameSet = Set<String>()
    
//    MARK: - Lifecycle
    
    init(view: HomeViewProtocol? = nil) {
        self.view = view
    }
    
//    MARK: - Helpers
    
    func sendToFlight(nickname: String, describe: String) {
        if (nickname.isEmpty || describe.isEmpty) {
            view?.setAlert("Пожалуйста, запилните все поля")
        } else {
            if nicknameSet.contains(nickname) {
                view?.setAlert("Такой ник уже существует")
            } else {
                let currentDate = Date().timeIntervalSince1970
                let user = Credentials(nickname: nickname, describe: describe, start: currentDate)
                view?.clearLabel()
                router?.presentChoiseAsteroid(for: user)
            }
        }
    }
    
    func getNickname() {
        interactor?.getNickname()
    }
    
    func setNickname(_ result: Set<String>) {
        nicknameSet = result
    }
}
