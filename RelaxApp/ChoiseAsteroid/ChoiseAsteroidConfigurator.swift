//
//  ChoiseAsteroidConfigurator.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

protocol ChoiseAsteroidConfiguratorProtocol: AnyObject {
    func configure(with viewController: ChoiseAsteroidViewController)
}

final class ChoiseAsteroidConfigurator: ChoiseAsteroidConfiguratorProtocol {
    func configure(with viewController: ChoiseAsteroidViewController) {
        let presenter = ChoiseAsteroidPresenter(view: viewController)
        let interactor = ChoiseAsteroidInteractor(presenter: presenter)
        let router = ChoiseAsteroidRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
