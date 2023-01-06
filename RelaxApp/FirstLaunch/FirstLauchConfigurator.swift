//
//  FirstLauchConfigurator.swift
//  RelaxApp
//
//  Created by Александр Меренков on 24.12.2022.
//

protocol FirstLauchConfiguratorProtocol: AnyObject {
    func configure(with viewController: FirstLauchViewController)
}

final class FirstLauchConfigurator: FirstLauchConfiguratorProtocol {
    func configure(with viewController: FirstLauchViewController) {
        let presenter = FirstLauchPresenter(view: viewController)
        let interactor = FirstLauchInteractor(presenter: presenter)
        let router = FirstLauchRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
