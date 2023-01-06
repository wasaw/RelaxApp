//
//  CompletedConfigurator.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

protocol CompletedConfiguratorProtocol: AnyObject {
    func config(with viewController: CompletedViewController)
}

final class CompletedConfigurator: CompletedConfiguratorProtocol {
    func config(with viewController: CompletedViewController) {
        let presenter = CompletedPresenter(view: viewController)
        let interactor = CompletedInteractor(presenter: presenter)
        let router = CompletedRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
