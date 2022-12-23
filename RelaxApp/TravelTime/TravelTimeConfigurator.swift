//
//  TravelTimeConfigurator.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

protocol TravelTimeConfiguratorProtocol: AnyObject {
    func config(with viewController: TravelTimeViewController)
}

final class TravelTimeConfigurator: TravelTimeConfiguratorProtocol {
    func config(with viewController: TravelTimeViewController) {
        let presenter = TravelTimePresenter(view: viewController)
        let interactor = TravelTimeInteractor(presenter: presenter)
        let router = TravelTimeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
