//
//  TravelTimeInteractor.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

protocol TravelTimeInteractorProtocol: AnyObject {
    var presenter: TravelTimePresenterProtocol? { get set }
    func loadLocalInformation()
}

final class TravelTimeInteractor: TravelTimeInteractorProtocol {
    
//    MARK: - Properties
    var presenter: TravelTimePresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: TravelTimePresenterProtocol? = nil) {
        self.presenter = presenter
        loadLocalInformation()
    }
    
//    MARK: - Helpers
    
    func loadLocalInformation() {
        let answer = DatabaseService.shared.loadInformation()
        guard let answer = answer else { return }
        presenter?.presentLocalInformation(answer)
    }
}
