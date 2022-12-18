//
//  HomeConfigurator.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

protocol HomeConfiguratorProtocol: AnyObject {
    func configure(with viewController: HomeViewController)
}

final class HomeConfigurator: HomeConfiguratorProtocol {
    func configure(with viewController: HomeViewController) {
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
