//
//  CompletedPresenter.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

protocol CompletedPresenterProtocol: AnyObject {
    var view: CompletedViewProtocol? { get set }
    var interactor: CompletedInteractorProtocol? { get set }
    var router: CompletedRouterProtocol? { get set }
    func checkInformation()
    func setInformation(_ answer: [Delivered])
    func deleteSelectedItem(nickname: String)
    func isEmpty(_ information: [Delivered])
    func presentAlert(title: String, message: String)
}

final class CompletedPresenter: CompletedPresenterProtocol {
    
//    MARK: - Properties
    weak var view: CompletedViewProtocol?
    var interactor: CompletedInteractorProtocol?
    var router: CompletedRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: CompletedViewProtocol? = nil, interactor: CompletedInteractorProtocol? = nil, router: CompletedRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
//    MARK: - Helpers
    
    func checkInformation() {
        interactor?.loadInformation()
    }
    
    func setInformation(_ answer: [Delivered]) {
        view?.setInformation(answer)
    }
    
    func deleteSelectedItem(nickname: String) {
        interactor?.deleteCompleted(nickname: nickname)
    }
    
    func isEmpty(_ information: [Delivered]) {
        if information.isEmpty {
            view?.visibleTitle()
        }
    }
    
    func presentAlert(title: String, message: String) {
        view?.presentAlert(title: title, message: message)
    }
}
